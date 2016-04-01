import math
import time
from Point import Point

PIXELS_PER_METER = 191.0
HEIGHT_CAMERA = 3.0099 #2.921
HEIGHT_ROBOT = .116332

# conversion functions
timeToInt = lambda x: (x.secs-1420000000)*100 + x.nsecs/10000000
pixelToMeter = lambda x: x/PIXELS_PER_METER
meterToPixel = lambda x: int(x*PIXELS_PER_METER)
degreeToRadian = lambda x: x/180.0 * math.pi
radianToDegree = lambda x: int(x * 180.0 / math.pi)

def getTime():
  return int((time.time()-1420000000)*100.0)


CENTER = Point()
#MAX_SPEED = .7
HOME_GOAL = Point(1.68,0)
AWAY_GOAL = Point(-1.68,0)

MAX_SPEED = 1.2
MIN_SPEED = .3
MIN_DELTA = .3
SCALE_VEL = 5.0
SCALE_OMEGA = 3.0
RUSH_SPEED = .3
CIRCLE_SPEED = .3

SPEED_ROBOT = .6 # part of deprecated function.
SPEED_ROTATION = 1.0 # part of deprecated function.
DIS_BEHIND_BALL = .29
HEIGHT_FIELD_METER = 1.14
WIDTH_FIELD = 1.70
GUI_MARGIN = 10
STARTPOINTHOME = 0.45

HEIGHT_GOAL = 100
WIDTH_GOAL = 30

ROBOT_DIAMETER = .2032

MARGIN = DIS_BEHIND_BALL + ROBOT_DIAMETER/2
