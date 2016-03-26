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

def goStart(bret,ball):
    start = 0.45
    print "info for debugg"
    print "ballx,bally,homex,homey, hometheta",ball[0],ball[1],bret[0],bret[1],bret[2]
    vel.goXYOmegaTheta(bret[0],bret[1],bret[2])

def goCenter(data):
    xb = data.ball_x
    yb = data.ball_y
    xr = data.home1_x
    yr = data.home1_y
    tr = data.home1_theta
    print "info for debugg"
    print "ballx,bally,homex,homey, hometheta",xb,yb,xr,yr,tr
    vel.goXYOmegaTheta(xr,yr,tr)

#here we do homeX - 1.35 we go to home goal
#here we fo homeX + 1.35 we go to away goal
def goToGoal(data):
    distGoalX = 1.56
    #distGoaly = data.home1_y
    tg = data.home1_theta
    goX = data.home1_x+distGoalX
    goY = data.home1_y
    #goTheta = tg - data.home1_theta
    vel.goXYOmegaTheta(goX,goY,tg)

def goHomeGoal(data):
    distGoalX = -1.56
    #distGoaly = data.home1_y
    tg = data.home1_theta
    goX = data.home1_x+distGoalX
    goY = data.home1_y
    #goTheta = tg - data.home1_theta
    vel.goXYOmegaTheta(goX,goY,tg)

def goTopoint(x,y,t):
    vel.goXYOmegaTheta(x,y,t)


def getBall(bret,ball,goal):
    robotX = ball[0]-bret[0]    #has to be balllocation - robotLocation
    robotY = ball[1]-bret[1]
    g = P.goal


    if robotX == 0:
        robotX = .01
    xgoal = goal[0]-bret[0]
    if xgoal == 0:
        xgoal = .01
    #try:

    #toBall = math.acos(float(xball)/math.sqrt(float(xball)**2+float(yb-yr)**2))+tr
    #theta_d = m.atan2(yb-yr,xb-xr)
    #omega = P.control_k_phi*(tr - theta_d)

    toGoal = math.acos(float(xgoal)/math.sqrt(float(xgoal)**2+float(goal[1]-bret[1])**2))+bret[2]
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

    if ball[0] > goal[0] or ball[0] < -goal[0]:
        goStart(bret,ball)
    else:
        vel.goXYOmegaTheta(robotX,robotY,toGoal)

        #time.sleep(5)

    #kickTime(xr, toGoal, xball)
