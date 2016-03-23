#!/usr/bin/env python
import rospy
from roboclaw import *
#import pygame
import strategies
from storage import *
from std_msgs.msg import String
from robot_soccer.msg import convertedCoordinates
import calibratepid as c




#this code is an interface between humans and the robot
#it will call the motor functions and calibration and allow
#human input to start and stop the robot

K = kTimer()
P = param()
#go = 0
#pygame.init()
#pygame.display.set_mode((400, 400))
#pygame.key.set_repeat(10, 10)
#
def run_init(data):
    debbuging = strategies.strategy_init(data)
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


'''
 if go == 0:
	# wait for keyboard initialization
    for event in pygame.event.get():
		if event.type == pygame.QUIT:
		    sys.exit()
	    keys=pygame.key.get_pressed()

        # starts robot function
	    if keys[K_ENTER]:
		    print('Begin Roboboogie')
		    go = 1

		# quit the program
	    if keys[K_ESCAPE]:
		    print('The robots are dead!')
		    pygame.quit()

 if go != 0:
	for event in pygame.event.get():

        # quit the program
	    if keys[K_ESCAPE]:
		    print('The robots are dead!')
		    #pygame.quit()
			go = 0
'''