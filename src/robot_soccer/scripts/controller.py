import vect2motors
import calib
import pygame
import motor_control as mc

#
#this code is anm intreface between humans and the robot
#it will call the motor functions and calibration and allow
#human input to start and stop the robot


go = 0
pygame.init()
pygame.display.set_mode((400, 400))
pygame.key.set_repeat(10, 10)

while go == 0:
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
		    break

while go == 1:
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
	        keys=pygame.key.get_pressed()
	    if keys[K_ESC]:
		    print('Roboboogie is over')
		    go = 0
            vel.goXYOmegaTheta(0,0,0)


        # quit the program
	    if keys[K_ESCAPE]:
		    print('The robots are dead!')
		    pygame.quit()
		    break
    # below we put the code in that makes tactical decisions and calls the next move

    mc.getBall(data)