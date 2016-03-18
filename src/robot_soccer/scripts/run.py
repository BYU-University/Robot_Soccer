from controller import *
from robot_soccer.msg import convertedCoordinates
import motor_control


def run():
    bret = [data.home1_x, data.home1_y, data.home1_theta]
    ball = [data.ball_x, data.ball_y]

    # here we will pick tactics and call the functions
    bretToBall =  m.sqrt((ball[0]-bret[0])**2+(ball[1-bret[])**2)
    if bretToBall < .01:
        goToGoal(bret)
    else:
        goToBall(bret, ball)
