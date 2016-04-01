#!/usr/bin/env python
import rospy
from robot_soccer.msg import convertedCoordinates
import calibratepid as c
from roboclaw import *
import kick
import velchangers
from MotionSkills import *
import Locations
from param import *
from enum import Enum
from Point import *

'''
class GameState(Enum):
    stop = 1
    play = 2
    center = 3
    startPosition = 4
    test = 5
'''

class State(Enum):
    rushGoal = 1
    getBehindBall = 2
    rotateToAngleBehindBall = 3
    check = 4
    returnToPlay = 5
    stop = 6


# class TestState(Enum):
#  check = 1
#  rushGoal = 2
#  getBehindBall = 3

class Rotate(Enum):
    none = 1
    clockwise = 2
    counterClockwise = 3


class playable:
    def __init__(self):
        self.ball = Locations.Locations().ball
        self.robotHome1 = Locations.Locations().home1
        self.distanceToBall = 0
        self.state = State.check
        self.rotate = Rotate.none
        self.stopRushingGoalTime = 0
        self.newCommand = False
        self.vel_x = 0.0
        self.vel_y = 0.0
        self.omega = 0.0
        #self.gameState = GameState.stop
        self.stopped = True
    '''
    def executeCommCenterCommand(self, req):
        if req.comm == 1:
            self.gameState = GameState.stop
            self.state = State.check
            self.stopped = False
        elif req.comm == 2:
            self.gameState = GameState.play
        elif req.comm == 3:
            self.gameState = GameState.center
            self.state = State.check
            self.stopped = False
        elif req.comm == 4:
            self.gameState = GameState.startPosition
            self.state = State.check
            self.stopped = False
            # elif req.comm == 5:
            # self.testState = TestState.check
            # self.gameState = GameState
    '''
    def play(self,data):
        self.updateLocations(data)
        self.commandRoboclaws()
        # self.state == State.
        print "STATEMACHINE = ",self.state
        if self.state == State.check:
            self.state = State.getBehindBall
            if abs(self.robotHome1.x) > HOME_GOAL.x or abs(self.ball.x) > WIDTH_FIELD:
                self.state = State.returnToPlay
            elif (MotionSkills.isPointInFrontOfRobot(self.robotHome1, self.ball, 0.5, 0.04 + abs(
                        MAX_SPEED / 4))):  # This offset compensates for the momentum
                self.state = State.rushGoal  # rush goal
                self.stopRushingGoalTime = getTime() + int(2 * DIS_BEHIND_BALL / MAX_SPEED * 100)

        if self.state == State.returnToPlay:
            self.go_to_point(CENTER.x+STARTPOINTHOME, CENTER.y, AWAY_GOAL)
            if abs(self.robotHome1.x) < .4 and abs(self.robotHome1.y) < .45:
                if abs(self.ball.x) > WIDTH_FIELD or abs(self.ball.y) > HEIGHT_FIELD_METER:
                    self.state == State.stop
                else:
                    self.state = State.check
            if abs(self.ball.x) < WIDTH_FIELD and abs(self.ball.y) < HEIGHT_FIELD_METER:
                self.state == State.check

        if self.state == State.rushGoal:
            # self.speed = RUSH_SPEED
            # self.go_to_point(HOME_GOAL.x, HOME_GOAL.y, HOME_GOAL)
            #Maybe here we need to have HOME_GOAL
            print "AWAY Values: ",AWAY_GOAL.x,AWAY_GOAL.y
            self.go_direction(AWAY_GOAL)
            if getTime() >= self.stopRushingGoalTime:
                kick.kick()
                self.state = State.check

        # check if ball is behind robot
        if self.state == State.getBehindBall:
            #ball is behind the Robot
            print "PLAY VALUES:", self.ball.x,self.ball.y
            if MotionSkills.isBallBehindRobot(self.robotHome1, self.ball):
                #robot has to be behind the ball ....and ball front robot
                behindTheBallPoint = MotionSkills.getPointBehindBall(self.ball)
                print "behindTheBallPoint Values", behindTheBallPoint.x,behindTheBallPoint.y
                self.go_direction(behindTheBallPoint)
                self.state = State.check
            else:
                print "INSIDTHE GETBEHIND:",self.ball.x,self.ball.y
                # Robot is behind the ball but don't know yet the Y
                # This gets a point beside the ball perpendicular to the line of the ball and the goal
                # point = getPointBesideBall(self.robotLocation, self.ball.point, DIS_BEHIND_BALL)
                point = Point(self.ball.x,self.ball.y)
                print "Values for the ball",point.x,point.y
                # if robot above  ball
                if self.ball.y < self.robotHome1.y:
                    point.y = self.ball.y + DIS_BEHIND_BALL
                else:
                    point.y = self.ball.y - DIS_BEHIND_BALL
                if abs(point.y) > float(HEIGHT_FIELD_METER):
                        point.y = float(HEIGHT_FIELD_METER - 0.07)
                        print "valor muito grande",point.x,point.y
                print " POINT values: ",point.x,point.y
                self.go_direction(point)
        if self.state == State.stop:
            self.robotHome1(0,0,0)


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
        # print bestDelta
        if mag >= MAX_SPEED:
            self.vel_x = (MAX_SPEED / mag) * self.vel_x
            self.vel_y = (MAX_SPEED / mag) * self.vel_y
        elif mag < MIN_SPEED:
            self.vel_x = 0#vektor_x = 0
            self.vel_y = 0#vektor_y = 0

        if bestDelta < MIN_DELTA and bestDelta > -MIN_DELTA:
            bestDelta = 0
            self.omega = bestDelta
        #self.sendCommand(vektor_x, vektor_y, bestDelta, self.robotHome1.theta)


    '''
    def executionLoop(self, scheduler):
        scheduler.enter(.05, 1, self.executionLoop, (scheduler,))
        self.gameState == GameState.play
        if self.gameState == GameState.play:
            self.play()
        elif self.gameState == GameState.stop:
            if self.stopped == False:
                # self.sendCommand(0,0,0);
                self.stopped = True;
        elif self.gameState == GameState.center:
            self.updateLocations(data)
        if abs(self.robotHome1.x) > .1 or abs(self.robotHome1.y) > .1 or abs(self.robotHome1.theta) > .1:
          self.go_to_point(CENTER.x, CENTER.y, HOME_GOAL)
    '''
    def updateLocations(self,data):
        #test only
        #self.robotHome1(1.3,1,2)
        self.robotHome1(data.home1_x,data.home1_y,data.home1_theta)
        #print "test for printing robotHome1 ", (self.robotHome1.x)
        #self.ball.x = 1
        #elf.ball.y = 0.4
        self.ball.x = data.ball_x
        self.ball.y = data.ball_y
        print "BALL INIT: ",self.ball.x,self.ball.y
        self.distanceToBall = math.sqrt((self.ball.x-self.robotHome1.x)**2+(self.ball.y-self.robotHome1.y)**2)
        #print 'ballX:%f ballY:%f x: %f  y: %f  theta: %f' % (self.ball.x, self.ball.y, self.robotHome1.x, self.robotHome1.y, self.robotHome1.theta)

    def go_direction(self, point):
        print "X and Y", point.x,point.y
        print "robotHome coordinates",self.robotHome1.x,self.robotHome1.y,self.robotHome1.theta
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

    def commandRoboclaws(self):
        print "values of vel_x,vel_y,Omega,Theta:", self.vel_x, self.vel_y, self.omega, self.robotHome1.theta
        velchangers.goXYOmegaTheta(-self.vel_x, -self.vel_y, self.omega, self.robotHome1.theta)

        # def run_init(data):

    #    strategies.strategy_init(data)

    def go(self):
     rospy.init_node('go', anonymous=True)
     print "go function"
     rospy.Subscriber('coordinates', convertedCoordinates, winner.play)#updateLocations)

    # s = sched.scheduler(time.time, time.sleep)
    # s.enter(0,1,self.executionLoop,(s,))
    # s.run()
     rospy.spin()


if __name__ == '__main__':
    try:

        Open('/dev/ttySAC0', 38400)
        c.setvelocity()
        winner = playable()
        print "START...................."
        winner.go()
        #winner.updateLocations()
        #winner.play()
    except:
        global _SERIAL_ERR
        _SERIAL_ERR = True
