#!/usr/bin/env python
import rospy
from roboclaw import *
from robot_soccer.msg import convertedCoordinates
from PID import *
import strategies_jamaine
from storage import *
import calibratepid as c


#this code is an interface between humans and the robot
#it will call the motor functions and calibration and allow
#human input to start and stop the robot

K = kTimer
P = param
G = gameInfo
#var = pVars.__init__(self)
vals = pidVals()


def run_init(data):
    # debbuging = strategies.strategy_init(data)
    debbuging = strategies_jamaine.strategy_init(data)
    #rospy.loginfo("information for debuging",debbuging)
def mainController():
    # In ROS, nodes are uniquely named. If two nodes with the same
    # node are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'talker' node so that multiple talkers can
    # run simultaneously.
    rospy.init_node('mainController', anonymous=True)

    # This subscribes to the velTopic topic expecting the 'velocities' message
    rospy.Subscriber('coordinates', convertedCoordinates, run_init)
    #rospy.loginfo(msg)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()


if __name__ == '__main__':
    try:
        Open('/dev/ttySAC0', 38400)
        c.setvelocity()
        mainController()
    except:
        global _SERIAL_ERR
        _SERIAL_ERR = True
