import pygame
import run
from storage import *
import rospy
from robot_soccer.msg import convertedCoordinates


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

    # below we put the code in that makes tactical decisions and calls the next move
    rospy.init_node('motorControl', anonymous=True)

    # This subscribes to the velTopic topic expecting the 'velocities' message
    rospy.Subscriber('coordinates', convertedCoordinates, run)
    #rospy.loginfo(msg)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()
