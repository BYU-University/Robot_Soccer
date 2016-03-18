import vect2motors
import calib
import pygame
import run
from storage import *
import rospy
import math as m
import motor_control as mc

#
#this code is an interface between humans and the robot
#it will call the motor functions and calibration and allow
#human input to start and stop the robot

P = P()
go = 0
pygame.init()
pygame.display.set_mode((400, 400))
pygame.key.set_repeat(10, 10)

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

		# starts robot function
	    if keys[K_SPACE]:
		    print('Start positions!')
		    goToStartForward(jamaine)
			goToStartDefender(bret)

        # quit the program
	    if keys[K_ESCAPE]:
		    print('The robots are dead!')
		    pygame.quit()
		    break

if go != 0:
	for event in pygame.event.get():

        # quit the program
	    if keys[K_ESCAPE]:
		    print('The robots are dead!')
		    pygame.quit()
		    break
    # below we put the code in that makes tactical decisions and calls the next move
    rospy.init_node('motorControl', anonymous=True)

    # This subscribes to the velTopic topic expecting the 'velocities' message
    rospy.Subscriber('coordinates', convertedCoordinates, run)
    #rospy.loginfo(msg)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

