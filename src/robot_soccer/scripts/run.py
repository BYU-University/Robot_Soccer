import math as m
import plays as p


def run(data):
    bret = [data.home1_x, data.home1_y, data.home1_theta]
    ball = [data.ball_x, data.ball_y]
    bretToBall = m.sqrt((ball[0]-bret[0])**2+(ball[1]-bret[1])**2)
    # here we will pick tactics and call the functions

    if bretToBall < .01:
        p.goToGoal(bret)

    else:
        p.goToBall(bret, ball)
