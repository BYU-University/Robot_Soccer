#!/usr/bin/env python
import rospy
from robot_soccer.msg import convertedCoordinates
import calibratepid_j as c
from roboclaw import *
import kick
import velchangers
from MotionSkills import *
import Locations
from param import *
from enum import Enum
from Point import *
#import readchar
#from Tkinter import *
#from msvcrt import getch


class State(Enum):
    check = 1
    getBehindBall = 2
    rushGoal = 3
    returnToPlay = 4
    scoreGoal = 5
    stop = 6
    wait = 7


class playable:
    def __init__(self):
        self.ball = Locations.Locations().ball
        self.robotHome2 = Locations.Locations().home2
        self.distanceToBall = 0
        self.state = State.check
        self.stopRushingGoalTime = 0
        self.newCommand = False
        self.vel_x = 0.0
        self.vel_y = 0.0
        self.omega = 0.0
        self.desiredPoint = 0.0
        self.stopped = True



#This is the state machine
    def play(self,data):
        self.updateLocations(data)
        self.commandRoboclaws()
        print "STATEMACHINE = ",self.state
        if self.state == State.scoreGoal:
            self.score_goal()
            if abs(self.ball.x) > 0 and abs(self.ball.x) <0.3 and abs(self.ball.y) > 0 and abs(self.ball.y) < 0.3:
                self.state = State.check
            else:
                self.state = State.scoreGoal
        else:
            self.state = State.check
        #elif abs(self.ball.x) > WIDTH_FIELD or abs(self.ball.y) > HEIGHT_FIELD_METER:
        #    self.state = State.returnToPlay
        #else:
         #   self.state = State.scoreGoal

#Check State
        if self.state == State.check:
            if (self.robotHome2.x > (self.desiredPoint.x + 0.05) or self.robotHome2.x < (self.desiredPoint.x - 0.05)) or \
                (self.robotHome2.y > (self.desiredPoint.y + 0.05) or self.robotHome2.y < (self.desiredPoint.y - 0.05)):
                self.state = State.getBehindBall
                if (MotionSkills.isPointInFrontOfRobot(self.robotHome2, self.ball, 0.1, 0.03 + abs(MAX_SPEED / 4))):  # This offset compensates for the momentum
                    self.state = State.rushGoal  # rush goal
                    self.stopRushingGoalTime = getTime() + int(2 * DIS_BEHIND_BALL / MAX_SPEED * 100)
                    print "This is stopRuchTIme: ",self.stopRushingGoalTime


            if abs(self.robotHome2.x) > HOME_GOAL.x and abs(self.ball.y) > HEIGHT_FIELD_METER:
                self.state = State.returnToPlay
            if abs(self.ball.x) > HOME_GOAL.x:
                self.state = State.scoreGoal

            #if (self.robotHome2.x > (AWAY_GOAL.x+ 0.4)) and \
            #(self.robotHome2.y > (AWAY_GOAL.y + 0.3) and self.robotHome2.y < (AWAY_GOAL.y - 0.3)):

#Return To Play State
        if self.state == State.returnToPlay:
            print"HOMERobot: ",self.robotHome2.x,self.robotHome2.y,self.robotHome2.theta
            self.go_to_point(CENTER.x+STARTPOINTHOME, CENTER.y, HOME_GOAL)

            if (self.robotHome2.x + STARTPOINTHOME) > (STARTPOINTHOME - 0.30) and (self.robotHome2.x + STARTPOINTHOME) \
                    < (STARTPOINTHOME + 0.36) and (self.robotHome2.y + STARTPOINTHOME) > (STARTPOINTHOME - 0.22) and (self.robotHome2.y) \
                    < (STARTPOINTHOME + 0.22):
                if abs(self.ball.x) > WIDTH_FIELD or abs(self.ball.y) > HEIGHT_FIELD_METER:
                    self.state = State.stop
                else:
                    time.sleep(5)
                    self.state = State.check

#RushGoal State
        if self.state == State.rushGoal:
            #self.rush_goal()
            self.go_direction(AWAY_GOAL)
            if self.distanceToBall < 0.11:
                kick.kick()
            print "this is getime: ", getTime()
            if getTime() >= self.stopRushingGoalTime:
                kick.kick()
            else:
                self.state = State.check

#Stop State
        if self.state == State.stop:
            self.stop_robot()

#GetBehindBall State
        if self.state == State.getBehindBall:
            self.go_to_point_behind_ball()
            #self.state = State.check


# Here are the functions for the state machine
    def rush_goal(self):
        point_desired = AWAY_GOAL

        #if  (self.robotHome2.x > (point_desired.x + 0.4)) or \
         #   (self.robotHome2.y > (point_desired.y + 0.3) or self.robotHome2.y < (point_desired.y - 0.3)):

        targetAngle = MotionSkills.angleBetweenPoints(Point(self.robotHome2.x, self.robotHome2.y), point_desired)
        angle_fix = (self.robotHome2.theta - targetAngle + RADIAN180) % RADIAN360 - RADIAN180
        angular_command = MotionSkills.go_to_angle(self.robotHome2, HOME_GOAL)
        omega = angular_command.omega
        if(angle_fix <= RADIAN5 and angle_fix >= -RADIAN5):
            omega = 0
        command = MotionSkills.go_to_point(self.robotHome2, point_desired)
        self.vel_x = command.vel_x
        self.vel_y = command.vel_y
        self.omega = omega
        time.sleep(DELAY)


    def score_goal(self):
        self.goStart()


    def stop_robot(self):
        self.vel_x = 0
        self.vel_y = 0
        self.omega = 0
        #print "StopPosition",self.robotHome2.x,self.robotHome2.y,self.robotHome2.theta


    def go_to_point_behind_ball(self):
        robot_point = Point(self.robotHome2.x, self.robotHome2.y)
        self.desiredPoint = MotionSkills.getPointBehindBall(self.ball, AWAY_GOAL)
        pointP = Point(self.robotHome2.x, self.robotHome2.y)
        targetAngle = MotionSkills.angleBetweenPoints(pointP, self.desiredPoint)
        fix_angle = (self.robotHome2.theta - targetAngle + RADIAN180) % RADIAN360 - RADIAN180
        get_speed = MotionSkills.go_to_point(self.robotHome2, self.desiredPoint)
        angular_get_speed = MotionSkills.go_to_angle(self.robotHome2, HOME_GOAL)
        omega = angular_get_speed.omega
        if(fix_angle <= RADIAN5 and fix_angle >= -RADIAN5):
            omega = 0
        self.vel_x = get_speed.vel_x
        self.vel_y = get_speed.vel_y
        self.omega = omega #delta_angle
        time.sleep(DELAY)


    def go_to_point(self, x, y, lookAtPoint=None):
        # print "go_to_point"
        if lookAtPoint == None:
            lookAtPoint = self.ball
        desired_x = x
        desired_y = y

        self.vel_x = (desired_x - self.robotHome2.x) * SCALE_VEL
        self.vel_y = (desired_y - self.robotHome2.y) * SCALE_VEL

        mag = math.sqrt(self.vel_x ** 2 + self.vel_y ** 2)
        angle = math.atan2(lookAtPoint.y - self.robotHome2.y, lookAtPoint.x - self.robotHome2.x)

        delta_angle = angle - self.robotHome2.theta

        bestDelta = math.atan2(math.sin(delta_angle), math.cos(delta_angle)) * SCALE_OMEGA
        # print bestDelta
        #print " Check SPEED MAG and Vel_x, Vel_y ",mag,self.vel_x,self.vel_y
        if mag >= MAX_SPEED:
            self.vel_x = (MAX_SPEED / mag) * self.vel_x
            self.vel_y = (MAX_SPEED / mag) * self.vel_y
        elif mag < MIN_SPEED:
            self.vel_x = 0#vektor_x = 0
            self.vel_y = 0#vektor_y = 0

        if bestDelta < MIN_DELTA and bestDelta > -MIN_DELTA:
            bestDelta = 0
            self.omega = bestDelta

    def updateLocations(self,data):
        self.robotHome2(data.home1_x,data.home1_y,data.home1_theta)
        self.ball.x = data.ball_x
        self.ball.y = data.ball_y
        self.distanceToBall = math.sqrt((self.ball.x-self.robotHome2.x)**2+(self.ball.y-self.robotHome2.y)**2)
        self.desiredPoint = MotionSkills.getPointBehindBall(self.ball, AWAY_GOAL)
        print "Distance to ball: ",self.distanceToBall
        print "Desired Point Behind Ball: ",self.desiredPoint.x,self.desiredPoint.y

    def go_direction(self, point):
        print "X and Y", point.x,point.y
        angle = MotionSkills.angleBetweenPoints(self.robotHome2, point)
        self.vel_x = math.cos(angle) * MAX_SPEED
        self.vel_y = math.sin(angle) * MAX_SPEED
        des_angle = MotionSkills.angleBetweenPoints(self.ball, HOME_GOAL)
        delta_angle = MotionSkills.deltaBetweenAngles(self.robotHome2.theta, des_angle)
        if abs(delta_angle) < .1:
            self.omega = 0
        else:
            self.omega = delta_angle
        self.newCommand = True

    def go_direction2(self, point):
        print "X and Y", point.x,point.y
        print "robotHome coordinates",self.robotHome2.x,self.robotHome2.y,self.robotHome2.theta
        angle = MotionSkills.angleBetweenPoints(self.robotHome2, point)
        self.vel_x = math.cos(angle) * MAX_SPEED
        self.vel_y = math.sin(angle) * MAX_SPEED
        des_angle = MotionSkills.angleBetweenPoints(self.ball, HOME_GOAL)
        delta_angle = MotionSkills.deltaBetweenAngles(self.robotHome2.theta, des_angle)
        if abs(delta_angle) < .1:
            self.omega = 0
        else:
            self.omega = delta_angle * 3.0
        self.newCommand = True


    def commandRoboclaws(self):
        correctX = float(-self.vel_x)
        correctY = float(-self.vel_y)
        print "values of vel_x,vel_y,Omega,Theta: ", correctX, correctY, self.omega, self.robotHome2.theta
        velchangers.goXYOmegaTheta(correctX, correctY, self.omega, self.robotHome2.theta)


    def goStart(self):
        start = 0.45
        print "info for debugg"
        xposition = float(self.robotHome2.x-start)
    #print "ballx,bally,homex,homey, hometheta",-ball[0],ball[1],bret[0],bret[1],bret[2]
        self.vel_x = xposition
        self.vel_y = self.robotHome2.y
        self.omega = self.robotHome2.theta



    def go(self):
     rospy.init_node('go', anonymous=True)
     print "go function"
     rospy.Subscriber('coordinates', convertedCoordinates, winner.play)
     rospy.spin()


if __name__ == '__main__':
    try:
        Open('/dev/ttySAC0', 38400)
        c.setvelocity()
        winner = playable()
        print "START...................."
        winner.go()
    except:
        global _SERIAL_ERR
        _SERIAL_ERR = True
