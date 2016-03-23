import math as m
import plays as p
import kickTime as k
#import motor_control as m
import time
import kick


def strategy_init(data):

    bret = [data.home1_x, data.home1_y, data.home1_theta]
    jamaine = [data.home2_x, data.home2_y, data.home2_theta]

    ball = [data.ball_x, data.ball_y]
    bretToBall = m.sqrt((ball[0]-bret[0])**2+(ball[1]-bret[1])**2)
    jamaineToBall = m.sqrt((ball[0]-bret[0])**2+(ball[1]-bret[1])**2)
    # here we will pick tactics and call the functions

    # k.kickTime(0, bretToBall)

    if bretToBall < .01:
        p.goToGoal(bret)
        if data.home1_x > 1.78 and data.home1_y < -0.01:
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
        p.getBall(bret, ball)
        #Sp.goToStartDefender(jamaine)
        #p.defendBall(jamaine,ball)
    #p.getBall(data)


