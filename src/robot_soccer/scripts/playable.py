#!/usr/bin/env python
import rospy
from robot_soccer.msg import convertedCoordinates
from robot_soccer.msg import signal
import calibratepid as c
from roboclaw import *
import gotstuck as gt
import kick
import velchangers
from MotionSkills import *
import Locations
from param import *
from enum import Enum
from Point import *

#This file runs on first Robot. The robot will act as the forward player to score goals

class State(Enum):
    wait = 1
    check = 2
    getBehindBall = 3
    rushGoal = 4
    returnToPlay = 5
    goBackInit = 6
    stop = 7

class playable:
    def __init__(self):
        self.ball = Locations.Locations().ball
        self.robotHome1 = Locations.Locations().home1
        self.distanceToBall = 0
        self.state = State.wait
        self.stopRushingGoalTime = 0
        self.newCommand = False
        self.vel_x = 0.0
        self.vel_y = 0.0
        self.omega = 0.0
        self.desiredPoint = 0.0
        self.stopped = True
        #self.signal = Point()
        self.pause = 0
        self.reset = 0
        self.spin = 0
        self.front = 0
        self.back = 0
        self.gogo = 0
        #self.receive = Point()


#This is the state machine
    def play(self,data):

        self.updateLocations(data)
        self.commandRoboclaws()
        print "STATEMACHINE = ",self.state
#here is for communicate with our robot from desktop computer.
#We can stop, run. Also, we can spin, go forward and backward if the robot get stuck in the field.
        if self.pause == 1:
            self.state = State.stop
        if self.reset == 1:
            print "PRessed key for reset", self.reset
            self.state = State.goBackInit
        if self.spin == 1 or self.front == 1 or self.back == 1:
            print "PRessed key for spin, front, back", self.spin, self.front, self.back
            self.state = State.wait
        if self.gogo == 1:
            print "PRessed key for gogo", self.gogo
            self.state = State.check
        #else:
         #   self.state = State.wait

        if self.state == State.goBackInit:
            self.back_startPoint()
            if abs(self.ball.x) > 0 and abs(self.ball.x) <0.3 and abs(self.ball.y) > 0 and abs(self.ball.y) < 0.3:
                self.state = State.check
            elif self.robotHome1.x > 0 and self.robotHome1.x < STARTPOINTHOME:
                self.state = State.stop
            else:
                self.state = State.goBackInit
        if self.state == State.stop:
            if abs(self.ball.x) > 0 and abs(self.ball.x) <0.3 and abs(self.ball.y) > 0 and abs(self.ball.y) < 0.3:
                self.state = State.wait

            else:
                self.state = State.stop

#Wait state
        if self.state == State.wait:
            self.waitCommand()
            self.state = State.wait

#Check State
        if self.state == State.check:


            if (self.robotHome1.x > (self.desiredPoint.x + 0.05) or self.robotHome1.x < (self.desiredPoint.x - 0.05)) or \
                (self.robotHome1.y > (self.desiredPoint.y + 0.05) or self.robotHome1.y < (self.desiredPoint.y - 0.05)):
                self.state = State.getBehindBall


                if MotionSkills.isPointInFrontOfRobot(self.robotHome1, self.ball, 0.11, 0.05 + abs(MAX_SPEED / 4)):  # This offset compensates for the momentum
                    self.state = State.rushGoal  # rush goal
                    self.stopRushingGoalTime = getTime() + int(2 * DIS_BEHIND_BALL / MAX_SPEED * 100)
                    print "This is stopRuchTIme: ",self.stopRushingGoalTime


            if abs(self.robotHome1.x) > HOME_GOAL.x and abs(self.ball.y) > HEIGHT_FIELD_METER:
                self.state = State.returnToPlay
            if abs(self.ball.x) > HOME_GOAL.x:
                self.state = State.goBackInit


#Return To Play State
        if self.state == State.returnToPlay:
            print"HOMERobot: ",self.robotHome1.x,self.robotHome1.y,self.robotHome1.theta
            self.go_to_point(CENTER.x+STARTPOINTHOME, CENTER.y, HOME_GOAL)

            if (self.robotHome1.x + STARTPOINTHOME) > (STARTPOINTHOME - 0.30) and (self.robotHome1.x + STARTPOINTHOME) \
                    < (STARTPOINTHOME + 0.36) and (self.robotHome1.y + STARTPOINTHOME) > (STARTPOINTHOME - 0.22) and (self.robotHome1.y) \
                    < (STARTPOINTHOME + 0.22):
                if abs(self.ball.x) > WIDTH_FIELD or abs(self.ball.y) > HEIGHT_FIELD_METER:
                    self.state = State.stop
                else:
                    time.sleep(5)
                    self.state = State.check

#RushGoal State
        if self.state == State.rushGoal:
            self.rush_goal()
            #self.go_direction(AWAY_GOAL)
            if self.distanceToBall < 0.135:
                kick.kick()
                self.state = State.check
            print "this is getime: ", getTime()
            if getTime() >= self.stopRushingGoalTime:
                kick.kick()
                self.state = State.check
            else:
                #self.state = State.check
                self.state = State.rushGoal

#Stop State
        if self.state == State.stop:
            self.stop_robot()
            self.state = State.wait



#GetBehindBall State
        if self.state == State.getBehindBall:
            self.go_to_point_behind_ball()
            #self.testState = TestState.getBehindBall
            angleBallGoal = MotionSkills.angleBetweenPoints(self.ball,HOME_GOAL)
            deltaAngle = MotionSkills.deltaBetweenAngles(self.robotHome1.theta,angleBallGoal)
            #if MotionSkills.isPointInFrontOfRobot(self.robotHome1, self.ball, 0.11, 0.05 + abs(MAX_SPEED / 4)):  # This offset compensates for the momentum
            if MotionSkills.isPointInFrontOfRobot(self.robotHome1,self.ball) and abs(deltaAngle) < .12:
                self.state = State.rushGoal

            else:
                self.state = State.getBehindBall





# From here, there are the functions for the state machine

#Rush to goal function
    def rush_goal(self):
        point_desired = AWAY_GOAL

        targetAngle = MotionSkills.angleBetweenPoints(Point(self.robotHome1.x, self.robotHome1.y), point_desired)
        angle_fix = (self.robotHome1.theta - targetAngle + RADIAN180) % RADIAN360 - RADIAN180
        angular_command = MotionSkills.go_to_angle(self.robotHome1, HOME_GOAL)
        omega = angular_command.omega
        if(angle_fix <= RADIAN5 and angle_fix >= -RADIAN5):
            omega = 0
        command = MotionSkills.go_to_point(self.robotHome1, point_desired)
        self.vel_x = command.vel_x
        self.vel_y = command.vel_y
        self.omega = omega
        time.sleep(DELAY)

#Go to start point
    def back_startPoint(self):
        self.goStart()

#function to stop robot
    def stop_robot(self):
        self.vel_x = 0
        self.vel_y = 0
        self.omega = 0
        #print "StopPosition",self.robotHome1.x,self.robotHome1.y,self.robotHome1.theta

#Function working to go behind ball point
    def go_to_point_behind_ball(self):
        robot_point = Point(self.robotHome1.x, self.robotHome1.y)
        self.desiredPoint = MotionSkills.getPointBehindBall(self.ball, AWAY_GOAL)
        pointP = Point(self.robotHome1.x, self.robotHome1.y)
        targetAngle = MotionSkills.angleBetweenPoints(pointP, self.desiredPoint)
        fix_angle = (self.robotHome1.theta - targetAngle + RADIAN180) % RADIAN360 - RADIAN180
        get_speed = MotionSkills.go_to_point(self.robotHome1, self.desiredPoint)
        # I had to change the angle position from AWAY_GOAL to HOME_GOAL
        angular_get_speed = MotionSkills.go_to_angle(self.robotHome1, HOME_GOAL)
        omega = angular_get_speed.omega
        if(fix_angle <= RADIAN5 and fix_angle >= -RADIAN5):
            omega = 0
        self.vel_x = get_speed.vel_x
        self.vel_y = get_speed.vel_y
        self.omega = omega #delta_angle
        time.sleep(DELAY)

#Second function to go to point. Could be used as well to go behind ball
    def go_to_point(self, x, y, lookAtPoint=None):
        # print "go_to_point"
        if lookAtPoint == None:
            lookAtPoint = self.ball
        desired_x = x
        desired_y = y

        self.vel_x = (desired_x - self.robotHome1.x) * SCALE_VEL
        self.vel_y = (desired_y - self.robotHome1.y) * SCALE_VEL

        mag = math.sqrt(self.vel_x ** 2 + self.vel_y ** 2)
        angle = math.atan2(lookAtPoint.y - self.robotHome1.y, lookAtPoint.x - self.robotHome1.x)

        delta_angle = angle - self.robotHome1.theta

        bestDelta = math.atan2(math.sin(delta_angle), math.cos(delta_angle)) * SCALE_OMEGA
        if mag >= MAX_SPEED:
            self.vel_x = (MAX_SPEED / mag) * self.vel_x
            self.vel_y = (MAX_SPEED / mag) * self.vel_y
        elif mag < MIN_SPEED:
            self.vel_x = 0#vektor_x = 0
            self.vel_y = 0#vektor_y = 0

        if bestDelta < MIN_DELTA and bestDelta > -MIN_DELTA:
            bestDelta = 0
            self.omega = bestDelta

#Get the correct location of all scenario.
    def updateLocations(self,data):
        self.robotHome1(data.home1_x,data.home1_y,data.home1_theta)
        self.ball.x = data.ball_x
        self.ball.y = data.ball_y
        self.distanceToBall = math.sqrt((self.ball.x-self.robotHome1.x)**2+(self.ball.y-self.robotHome1.y)**2)
        self.desiredPoint = MotionSkills.getPointBehindBall(self.ball, AWAY_GOAL)
        print "Distance to ball: ",self.distanceToBall
        print "Desired Point Behind Ball: ",self.desiredPoint.x,self.desiredPoint.y
        HOME_GOAL.x = float(data.field_width/2-FIXFIELD)
        HOME_GOAL.y = float(data.field_height/2-FIXFIELD)
        print "SIZE OF THE FIELD : ", HOME_GOAL.x,HOME_GOAL.y

    def go_direction(self, point):
        print "X and Y", point.x,point.y
        angle = MotionSkills.angleBetweenPoints(self.robotHome1, point)
        self.vel_x = math.cos(angle) * MAX_SPEED
        self.vel_y = math.sin(angle) * MAX_SPEED
        des_angle = MotionSkills.angleBetweenPoints(self.ball, HOME_GOAL)
        delta_angle = MotionSkills.deltaBetweenAngles(self.robotHome1.theta, des_angle)
        if abs(delta_angle) < .1:
            self.omega = 0
        else:
            self.omega = delta_angle
        self.newCommand = True

#Function for keyboard input
    def waitCommand(self):
        if self.spin == 1:
            gt.spinningfull()
        elif self.front == 1:
            gt.fowardfull()
        elif self.back == 1:
            gt.backwardfull()
        else:
            self.stop_robot()

#Function for sending the speed to our robot
    def commandRoboclaws(self):
        correctX = float(-self.vel_x)  # for some how it was going backwards. Has to fix it
        correctY = float(-self.vel_y)
        print "values of vel_x,vel_y,Omega,Theta: ", correctX, correctY, self.omega, self.robotHome1.theta
        velchangers.goXYOmegaTheta(correctX, correctY, self.omega, self.robotHome1.theta)

#Go to start position
    def goStart(self):
        start = 0.45
        self.go_to_point(CENTER.x+start, CENTER.y, HOME_GOAL)



#Get the input keyboard signal command
    def signalCommand(self,info):
        self.pause = info.pause
        self.reset = info.reset
        self.spin = info.spin
        self.front = info.front
        self.back = info.back
        self.gogo = info.gogo

#Function based on ROS information. Gets the data from vision
    def go(self):
        rospy.init_node('go', anonymous=True)
        print "go function"
        rospy.Subscriber('coordinates', convertedCoordinates, winner.play)
        rospy.Subscriber( 'signal', signal, self.signalCommand,queue_size=6)
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
