import velchangers as vel
from strategies import *
from controller import *

# This is where we store our different plays


def goToBall(r, b):
    g = P.goal
    vx = -P.control_k_vx*(r[0]-b[0])
    vy = -P.control_k_vy*(r[1]-b[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[0])
    omega = P.control_k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


def goToGoal(r):
    g = P.goal
    #vx =
    vx = P.control_k_vx*(r[0]-g[0])
    vy = P.control_k_vy*(r[1]-g[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.control_k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


def goToStartForward(r):
    pos = P.startForward
    g = P.goal
    vx = P.control_k_vx*(r[0]-pos[0])
    vy = P.control_k_vy*(r[1]-pos[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.control_k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


def goToStartDefender(r):
    pos = P.startDefender
    g = P.goal
    vx = P.control_k_vx*(r[0]-pos[0])
    vy = P.control_k_vy*(r[1]-pos[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.control_k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)

def defendBall(r,b):
    g = P.goal
    vx = P.control_k_vx*(r[0])
    vy = P.control_k_vy*(r[1]-b[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.control_k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)

def goToPoint(r, pos):
    g = P.goal
    vx = P.control_k_vx*(r[0]-pos[0])
    vy = P.control_k_vy*(r[1]-pos[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[0])
    omega = P.control_k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


def goCenter(data):
    xb = data.ball_x
    yb = data.ball_y
    xr = data.home1_x
    yr = data.home1_y
    tr = data.home1_theta
    print "ballx,bally,homex,homey, hometheta",xb,yb,xr,yr,tr
    vel.goXYOmegaTheta(xr,yr,tr)



def getBall(data):
    xg = 1.6
    yg = 0
    xb = data.ball_x
    yb = data.ball_y
    xr = data.home1_x
    yr = data.home1_y
    tr = data.home1_theta
    #robotX = xr-xb
    #robotY = yr-yb
    robotX = xb-xr
    robotY = yb-yr
    g = P.goal

    xball = xb-xr
    if xball == 0:
        xball = .01
    xgoal = xg-xr
    if xgoal == 0:
        xgoal = .01
    #try:

    #toBall = math.acos(float(xball)/math.sqrt(float(xball)**2+float(yb-yr)**2))+tr
    theta_d = m.atan2(yb-yr,xb-xr)
    omega = P.control_k_phi*(tr - theta_d)

    toGoal = math.acos(float(xgoal)/math.sqrt(float(xgoal)**2+float(yg-yr)**2))+tr
    #rospy.loginfo("toBall and toGoal : %f, %f" %(toBall,toGoal))
    print(toGoal*180/math.pi) # converted to degrees
   # print(toBall*180/math.pi) # converted to degrees
    #except ValueError:
     #   print "Please enter 3 valid sides"


    #for P control goes to ball
    #vx = P.control_k_vx*(xr-xb)
    #vy = P.control_k_vy*(yr-yb)
    #theta_d = math.atan2(yg-yr, xg-xr)
    #omega = P.control_k_phi*(tr - theta_d)
    #vel.goXYOmegaTheta(vx, vy, omega)


    vel.goXYOmegaTheta(robotX,robotY,omega)

    #kickTime(xr, toGoal, xball)
