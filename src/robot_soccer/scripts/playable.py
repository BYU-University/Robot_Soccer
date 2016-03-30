#!/usr/bin/env python
import rospy
from robot_soccer.msg import convertedCoordinates
import calibratepid as c
from Ball import *
from roboclaw import *
import strategies
import sched
import Point
import math
import time
import kick
from robot_soccer.scripts import velchangers
from robot_soccer.scripts.MotionSkills import MotionSkills

CENTER = Point()
HEIGHT_FIELD_METER = 1.68
MAX_SPEED = .7
HOME_GOAL = Point(1.68,0)
AWAY_GOAL = Point(1.68,0)
DIS_BEHIND_BALL = .3
SCALE_VEL = 5.0
SCALE_OMEGA = 3.0
MIN_SPEED = .1
MIN_DELTA = .1
RUSH_SPEED = .3
CIRCLE_SPEED = .3


def getTime():
  return int((time.time()-1420000000)*100.0)

from enum import Enum
class GameState(Enum):
  stop = 1
  play = 2
  center = 3
  startPosition = 4
  test = 5

class State(Enum):
  rushGoal = 1
  getBehindBall = 2
  rotateToAngleBehindBall = 3
  check = 4
  returnToPlay = 5

#class TestState(Enum):
#  check = 1
#  rushGoal = 2
#  getBehindBall = 3

class Rotate(Enum):
  none = 1
  clockwise = 2
  counterClockwise = 3



class playable:
  def __init__(self):
    self.locations = None
    self.ball = Ball()
    self.robotLocation = None
    self.distanceToBall = 0
    self.state = State.check
    self.rotate = Rotate.none
    self.stopRushingGoalTime = 0
    self.newCommand = False
    self.vel_x = 0.0
    self.vel_y = 0.0
    self.omega = 0.0
    self.gameState = GameState.stop
    self.stopped = True
    #self.testState = TestState.check

    self.lastBall = Ball()
    self.lastTimeStamp = -1
    self.currBallXVel = 0
    self.currBallYVel = 0

    self.integrator = {'x': 0, 'y': 0, 'w': 0}
    self.differentiator = {'x': 0, 'y': 0, 'w': 0}
    self.error_d1 = {'x': 0, 'y': 0, 'w': 0}


  def executeCommCenterCommand(self,req):
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
    #elif req.comm == 5:
      #self.testState = TestState.check
      #self.gameState = GameState





  def play(self):
    self.updateLocations()
    self.commandRoboclaws()
    if self.state == State.check:
      self.state = State.getBehindBall
      if self.robotLocation[0] > HOME_GOAL[0]:
        self.state = State.returnToPlay
      elif (MotionSkills.isPointInFrontOfRobot(self.robotLocation,self.ball.point, 0.5, 0.04 + abs(MAX_SPEED/4))): #This offset compensates for the momentum
        self.state = State.rushGoal# rush goal
        self.stopRushingGoalTime = getTime() + int(2 * DIS_BEHIND_BALL/MAX_SPEED*100)


    if self.state == State.returnToPlay:
      self.go_to_point(CENTER.x, CENTER.y, HOME_GOAL)
      if abs(self.robotLocation[0]) < .2 and abs(self.robotLocation[1]) < .2:
        self.state = State.check

    if self.state == State.rushGoal:
      #self.speed = RUSH_SPEED
      #self.go_to_point(HOME_GOAL.x, HOME_GOAL.y, HOME_GOAL)
      self.go_direction(HOME_GOAL)
      if getTime() >= self.stopRushingGoalTime:
        kick()
        self.state = State.check

    #check if ball is behind robot
    if self.state == State.getBehindBall:
      #robot in front of ball
      if MotionSkills.isBallBehindRobot(self.robotLocation, self.ball.point):
        # This gets a point beside the ball perpendicular to the line of the ball and the goal
        #point = getPointBesideBall(self.robotLocation, self.ball.point, DIS_BEHIND_BALL)

        point = Point(self.ball.point.x)
        # if robot above ball
        if self.ball.point.y < self.robotLocation[1]:
            point.y = self.ball.point.y + DIS_BEHIND_BALL
        else:
            point.y = self.ball.point.y - DIS_BEHIND_BALL

        self.go_direction(point)
        #Move to the side of the ball
        #self.go_to_point(point.x,point.y)
      #robot behind ball
      else:
        behindTheBallPoint = MotionSkills.getPointBehindBall(self.ball)
        self.go_direction(behindTheBallPoint)
        self.state = State.check


  def go_to_point(self,x, y, lookAtPoint=None):
    #print "go_to_point"
    if lookAtPoint == None:
      lookAtPoint = self.ball.point
    desired_x = x
    desired_y = y

    vektor_x = (desired_x-self.robotLocation[0]) * SCALE_VEL
    vektor_y = (desired_y-self.robotLocation[1]) * SCALE_VEL

    mag = math.sqrt(vektor_x**2+vektor_y**2)
    angle = math.atan2(lookAtPoint.y-self.robotLocation[1], lookAtPoint.x-self.robotLocation[0])

    delta_angle = angle-self.robotLocation[2]

    bestDelta = math.atan2(math.sin(delta_angle), math.cos(delta_angle)) * SCALE_OMEGA
    #print bestDelta
    if mag >= MAX_SPEED:
      vektor_x = (MAX_SPEED/mag)*vektor_x
      vektor_y = (MAX_SPEED/mag)*vektor_y
    elif mag < MIN_SPEED:
      vektor_x = 0
      vektor_y = 0

    if bestDelta < MIN_DELTA and bestDelta > -MIN_DELTA:
      bestDelta = 0
    self.sendCommand(vektor_x, vektor_y, bestDelta, self.robotLocation[2])


  def executionLoop(self, scheduler):
    scheduler.enter(.05, 1, self.executionLoop,(scheduler,))
    if self.gameState == GameState.play:
      self.play()
    elif self.gameState == GameState.stop:
      if self.stopped == False:
        #self.sendCommand(0,0,0);
        self.stopped = True;
    elif self.gameState == GameState.center:
        self.updateLocations()
    if abs(self.robotLocation[0]) > .1 or abs(self.robotLocation[1]) > .1 or abs(self.robotLocation[2]) > .1:
        self.go_to_point(CENTER.x, CENTER.y, HOME_GOAL)




  def updateLocations(self):
    #print (self.locations.ball.x, self.locations.ball.y)
    self.robotLocation = [self.home1_x,self.home1_y,self.home1_theta]
    self.ball.point.x = self.ball_x
    self.ball.point.y = self.ball_y
    self.distanceToBall = math.sqrt((self.robotLocation[0]-self.ball.point.x)**2+(self.robotLocation[1]-self.ball.point.y)**2)
    #print 'time: %f x: %f  y: %f  theta: %f' %(robotLocation.timestamp, robotLocation.x, robotLocation.y, robotLocation.theta)


  def go_direction(self, point):
    angle = MotionSkills.angleBetweenPoints(self.robotLocation,point)
    self.vel_x = math.cos(angle) * MAX_SPEED
    self.vel_y = math.sin(angle) * MAX_SPEED
    des_angle = MotionSkills.angleBetweenPoints(self.ball.point,HOME_GOAL)
    delta_angle = MotionSkills.deltaBetweenAngles(self.robotLocation[2],des_angle)
    if abs(delta_angle) < .1:
      self.omega = 0
    else:
      self.omega = delta_angle
    self.newCommand = True


  def commandRoboclaws(self):
    velchangers.goXYOmegaTheta(self.vel_x,self.vel_y,self.omega,self.robotLocation.theta)


#def run_init(data):
#    strategies.strategy_init(data)

  def go(self):
    rospy.init_node('mainController', anonymous=True)

    rospy.Subscriber('coordinates', convertedCoordinates, updateLocations)
    s = sched.scheduler(time.time, time.sleep)
    s.enter(0,1,self.executionLoop,(s,))
    s.run()
    #rospy.spin()


if __name__ == '__main__':
    try:
        Open('/dev/ttySAC0', 38400)
        c.setvelocity()
        winner = playable()
        winner.go()
    except:
        global _SERIAL_ERR
        _SERIAL_ERR = True

