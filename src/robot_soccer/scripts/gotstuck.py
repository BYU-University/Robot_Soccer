

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
#import readchar
#from Tkinter import *
#from msvcrt import getch




def fowardfull():
    ForwardM1(128,50)
    ForwardM2(128,50)
    ForwardM1(129,0)
    time.sleep(1)
    ForwardM1(128,0)
    ForwardM2(128,0)
    ForwardM1(129,0)
    time.sleep(0.5)


def spinningfull():
    ForwardM1(128,60)
    ForwardM2(128,60)
    ForwardM1(129,60)
    time.sleep(1)
    ForwardM1(128,0)
    ForwardM2(128,0)
    ForwardM1(129,0)

def run():
    ForwardM1(128,30)
    ForwardM2(128,30)
    ForwardM1(128,30)
    time.sleep(0.5)
    ForwardM1(128,35)
    ForwardM1(129,40)
    ForwardM2(128,0)
    time.sleep(1.5)
    kick.kick()
    BackwardM2(128,35)
    BackwardM1(129,40)
    BackwardM1(128,0)
    time.sleep(1.5)
    BackwardM2(128,20)
    BackwardM1(129,20)
    BackwardM1(128,20)
    time.sleep(0.5)

if __name__ == '__main__':
    try:
        Open('/dev/ttySAC0', 38400)
        print "START...................."
        print " s to spinning, f to Forward, b to Backward"
        choice = raw_input('--> ')
        if choice == 'f':
            fowardfull()
        if choice == 's':
            spinningfull()
    except:
        global _SERIAL_ERR
        _SERIAL_ERR = True