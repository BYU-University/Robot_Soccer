import math as m
import plays as p
import kickTime as k
from controller import *
#import motor_control as m
import time


def strategy_init(data):

    bret = [data.home1_x, data.home1_y, data.home1_theta]
    # jamaine = [data.home2_x, data.home2_y, data.home2_theta]

    ball = [data.ball_x, data.ball_y]
    bretToBall = m.sqrt((ball[0]-bret[0])**2+(ball[1]-bret[1])**2)
    bretToGoal = m.sqrt((P.goal[0]-bret[0])**2+(P.goal[1]-bret[1])**2)
    jamaineToBall = m.sqrt((ball[0]-bret[0])**2+(ball[1]-bret[1])**2)
    # here we will pick tactics and call the functions
    if data.home1_x < - 1.45:
        p.goHomeGoal(data)
    if data.home1_x > 1.45:
        p.goToGoal(data)
    #time.sleep(8)
    #p.goToOposeGoal()
    #time.sleep(10)
    #p.goCenter(data)
    #time.sleep(5)

'''
    k.kickTime(bretToGoal, bretToBall)

    if bretToBall < .01:
        p.goToGoal(bret)
        if data.home1_x > 1.6 and data.home1_y < -0.01:
            p.goCenter(data)  # reset robot to go center field
            time.sleep(5)
   # if jamaineToBall < 0.02:
    #    kick.kick()
    #    time.sleep(0.5)

    # reset robot positions
    #elif keys[K_SPACE]:
    #   print('Start positions!')
    #   # p.goToStartDefender(jamaine)
	#   p.goToStartForward(bret)

    else:
        #p.goToBall(bret, ball)
        p.getBall(data)
        #Sp.goToStartDefender(jamaine)
        #p.defendBall(jamaine,ball)
    #p.getBall(data)
'''

