import math as m
import plays as p
#import motor_control as m


def strategy_init(data):
    bret = [data.home1_x, data.home1_y, data.home1_theta]
    # jamaine = [data.home2_x, data.home2_y, data.home2_theta]
    ball = [data.ball_x, data.ball_y]
    bretToBall = m.sqrt((ball[0]-bret[0])**2+(ball[1]-bret[1])**2)
    # jamaineToBall = m.sqrt((ball[0]-bret[0])**2+(ball[1]-bret[1])**2)
    # here we will pick tactics and call the functions

    if bretToBall < .01:
        p.goToGoal(bret)

    # reset robot positions
    #elif keys[K_SPACE]:
    #   print('Start positions!')
    #   # p.goToStartDefender(jamaine)
	#   p.goToStartForward(bret)

    else:
        p.goToBall(bret, ball)



