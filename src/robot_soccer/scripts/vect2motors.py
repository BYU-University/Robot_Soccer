# calculations
import math

def vect2motors():
    
    speed = 1
    xg = 180
    yg = 0
    # info from vision, need to format correctly
    xb = msg->ball_x
    yb = msg->ball_y
    xr = msg->home1_x
    yr = msg->home1_y
    tr = msg->home1_theta

    toBall = math.atan((yb-yr)/(xb-xr))
    toGoal = math.atan((yg-yr)/(xg-xr))
    
    xCommand = math.cos(toBall)*speed
    yCommand = math.sin(toBall)*speed

#    inputs for movement

#    head to ball, face the goal
#    [xCommand,yCommand,toGoal]
