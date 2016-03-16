#!/usr/bin/env python
#import kickTime as kt
import rospy
from roboclaw import *
import calibratepid as c
import kick as k
import math
#import matimport velchangers as vel
#import param
from std_msgs.msg import String
#from robot_soccer.msg import velocities
#from robot_soccer.msg import locations
from robot_soccer.msg import convertedCoordinates
#import calibratepid
#import tty, sys

sample_rate = 0.01
k_vx  = 5  # gain for proportional control of x-position
k_vy  = 5  # gain for proportional control of y-position
k_phi = 2  # gain for proportional angle control

kickX = 0.1
kickY = 0.1
count = 0
bZ = 10      # buffer zone
kR = .09     # kick range
aA = .05     # angular accuracy
fPS = 20     # fieldx-position to shoot from
cL = 1000    # count limit to reset

Open('/dev/ttySAC0', 38400)

def getBall(data):
    xg = 1.6
    yg = 0
    xb = data.ball_x
    yb = data.ball_y
    xr = data.home1_x
    yr = data.home1_y
    tr = data.home1_theta
    robotX = xr-xb
    robotY = yr-yb

    xball = xb-xr
    if xball == 0:
        xball = .01
    xgoal = xg-xr
    if xgoal == 0:
        xgoal = .01
    #try:
    toBall = math.acos(float(xball)/math.sqrt(float(xball)**2+float(yb-yr)**2))+tr
    toGoal = math.acos(float(xgoal)/math.sqrt(float(xgoal)**2+float(yg-yr)**2))+tr
    rospy.loginfo("toBall and toGoal : %f, %f" %(toBall,toGoal))
    print(toGoal*180/math.pi) # converted to degrees
    print(toBall*180/math.pi) # converted to degrees
    #except ValueError:
     #   print "Please enter 3 valid sides"


    for P control
    vx = -k_vx*(xr-xpoint)
    vy = -k_vy*(yr-ypoint)
    theta_d = atan2(yg-yr, xg-xr)
    omega = -k_phi*(tr - theta_d)
    vel.goXYOmegaTheta(vx,vy,omega)


    # vel.goXYOmegaTheta(robotX,robotY,tr)

    #kickTime(xr, toGoal, xball)




def kickTime(xr, toGoal, xball):
    if count == 0 and xr > fPs and math.abs(toGoal) < aA and xball < kR:
        kick()
        count += 1
    elif count == 1000 or xball > bZ+kR:
        count = 0
    else:
        count += 1


'''
#utility - kalman filter for ball
lpf_alpha = 0.7
dirty_derivative_gain = P.camera_sample_rate/5
camera_sample_rate = 10*control_sample_rate

def ball = utility_kalman_filter_ball(ball,t,P)
    persistent xhat
    persistent xhat_delayed
    persistent S
    persistent S_delayed

    if t==0:  % initialize filter
        xhat = [...
            0;... % initial guess at x-position of ball
            0;... % initial guess at y-position of ball
            0;... % initial guess at x-velocity of ball
            0;... % initial guess at y-velocity of ball
            0;... % initial guess at x-acceleration of ball
            0;... % initial guess at y-acceleration of ball
            0;... % initial guess at x-jerk of ball
            0;... % initial guess at y-jerk of ball
            ];
        xhat_delayed = xhat;
        S = diag([...
            P.field_width/2;... % initial variance of x-position of ball
            P.field_width/2;... % initial variance of y-position of ball
            .01;... % initial variance of x-velocity of ball
            .01;... % initial variance of y-velocity of ball
            .001;... % initial variance of x-acceleration of ball
            .001;... % initial variance of y-acceleration of ball
            .0001;... % initial variance of x-jerk of ball
            .0001;... % initial variance of y-jerk of ball
            ]);
        S_delayed=S;

    # prediction step between measurements
    N = 10;
    for i=1:N:
        xhat = xhat + (P.control_sample_rate/N)*P.A_ball*xhat
        S = S + (P.control_sample_rate/N)*(P.A_ball*S+S*P.A_ball'+P.Q_ball)

    # correction step at measurement
    if ball.camera_flag, % only update when the camera flag is one indicating a new measurement
        # case 1 does not compensate for camera delay
        # case 2 compensates for fixed camera delay
        switch 2
            case 1:
                y = ball.position_camera; % actual measurement
                y_pred = P.C_ball*xhat;  % predicted measurement
                L = S*P.C_ball'/(P.R_ball+P.C_ball*S*P.C_ball')
                S = (eye(8)-L*P.C_ball)*S
                xhat = xhat + L*(y-y_pred)
            case 2,
                y = ball.position_camera; % actual measuremnt
                y_pred = P.C_ball*xhat_delayed;  % predicted measurement
                L = S_delayed*P.C_ball'/(P.R_ball+P.C_ball*S_delayed*P.C_ball');
                S_delayed = (eye(8)-L*P.C_ball)*S_delayed;
                xhat_delayed = xhat_delayed + L*(y-y_pred);
                for i=1:N*(P.camera_sample_rate/P.control_sample_rate),
                    xhat_delayed = xhat_delayed + (P.control_sample_rate/N)*(P.A_ball*xhat_delayed);
                    S_delayed = S_delayed + (P.control_sample_rate/N)*(P.A_ball*S_delayed+S_delayed*P.A_ball'+P.Q_ball);
                xhat = xhat_delayed;
                S    = S_delayed;

    % output current estimate of state
    ball.position     = xhat(1:2)
    ball.velocity     = xhat(3:4)
    ball.acceleration = xhat(5:6)
    ball.jerk         = xhat(7:8)
    ball.S            = S


#------------------------------------------
# utility - low pass filter ball position - differentiate for velocity
#
def ball = utility_lpf_ball(ball,t,P)
    persistent position
    persistent position_delayed
    persistent velocity
    persistent old_position_measurement
    persistent a1
    persistent a2

    if t==0:  # initialize filter
        position = matrix([[0], [0]])
        position_delayed = position
        velocity = matrix([[0], [0]])
        old_position_measurement = position
        # dirty derivative coefficients
        a1 = (2*P.dirty_derivative_gain-P.camera_sample_rate)/(2*P.dirty_derivative_gain+P.camera_sample_rate);
        a2 = 2/(2*P.dirty_derivative_gain+P.camera_sample_rate);

    switch 3,
        # case 1 does not compensate for camera delay
        # case 2 compensates for fixed camera delay
        # case 3 compensates for camera delay and wall bounces (doesn't account for robot bounces)
        case 1,
            if ball.camera_flag, # only update if there is a measurement
                # low pass filter position
                position = P.lpf_alpha*position + (1-P.lpf_alpha)*ball.position_camera
                # compute velocity by dirty derivative of position
                Ts = P.camera_sample_rate
                tau = P.dirty_derivative_gain
                velocity = a1*velocity + a2*(ball.position_camera-old_position_measurement)
                old_position_measurement = ball.position_camera
        case 2,
            if ball.camera_flag: # correction
                # low pass filter position
                position_delayed = P.lpf_alpha*position_delayed + (1-P.lpf_alpha)*ball.position_camera
                # compute velocity by dirty derivative of position
                velocity = a1*velocity + a2*(ball.position_camera-old_position_measurement)
                old_position_measurement = ball.position_camera
                # propagate upto current location
                for i=1:(camera_sample_rate/control_sample_rate):
                    position_delayed = position_delayed + control_sample_rate*velocity
                position = position_delayed
            else # prediction
                # propagate prediction ahead one control sample time
                position = position + control_sample_rate*velocity
        case 3,
            if ball.camera_flag: # correction
                # low pass filter position
                position_delayed = lpf_alpha*position_delayed + (1-lpf_alpha)*ball.position_camera
                # compute velocity by dirty derivative of position
                velocity = a1*velocity + a2*(ball.position_camera-old_position_measurement)
                velocity = utility_wall_bounce(position_delayed,velocity,P)
                old_position_measurement = ball.position_camera
                # propagate up to current location
                for i=1:(P.camera_sample_rate/P.control_sample_rate):
                    position_delayed = position_delayed + control_sample_rate*velocity
                    velocity = utility_wall_bounce(position_delayed,velocity,P)
                position = position_delayed
            else # prediction
                # propagate prediction ahead one control sample time
                position = position + control_sample_rate*velocity
                velocity = utility_wall_bounce(position,velocity,P) # <-- need to define P stuff

    # output current estimate of state
    ball.position     = position
    ball.velocity     = velocity
    ball.S            = .001*eye(2);  # this is for display only

#------------------------------------------
# utility - low pass filter ball position - differentiate for velocity
#
function velocity = utility_wall_bounce(position,velocity,P)
    # check for bounce off end walls
    if  abs(position(1)) >=  P.field_length/2:
        velocity(1)=-velocity(1)
    # check for bounce off side walls
    if  abs(position(2)) >=  P.field_width/2:
        velocity(2)=-velocity(2)

'''

def goCenter(data):
   # c.setvelocity()
    xb = data.ball_x
    yb = data.ball_y
    xr = data.home1_x
    yr = data.home1_y
    tr = data.home1_theta
    print "ballx,bally,homex,homey, hometheta",xb,yb,xr,yr,tr
    vel.goXYOmegaTheta(xr,yr,tr)

def vect2motors(data):
   # speed = 1
    xg = 180
    yg = 0
    # info from vision, need to format correctly
    xb = data.ball_x
    yb = data.ball_y
    xr = data.home1_x
    yr = data.home1_y
    tr = data.home1_theta
    rospy.loginfo("robot x,y,theta : %f, %f" %(xr,yr,tr))
    print "ballx,bally,homex,homey, hometheta",xb,yb,xr,yr,tr
    vel.goXYOmegaTheta(xr,yr,tr)

    xball = xb-xr
    if xball == 0:
	xball = .01
    xgoal = xg-xr
    if xgoal == 0:
        xgoal = .01
    try:
     toBall = math.acos(float(xball)/math.sqrt(float(xball)**2+float(yb-yr)**2))+tr
     toGoal = math.acos(float(xgoal)/math.sqrt(float(xgoal)**2+float(yg-yr)**2))+tr
     rospy.loginfo("toBall and toGoal : %f, %f" %(toBall,toGoal))
    except ValueError:
     print "Please enter 3 valid sides"
    
    #print toBall
    #print toGoal
    
    xCommand = math.cos(toBall)#*speed
    yCommand = math.sin(toBall)#*speed
    fixAngle = float(toGoal/500)
    rospy.loginfo("xcommand,ycommand and fixangle : %f, %f,%f" %(xCommand,yCommand,fixAngle))
    vel.testrun(xCommand,yCommand,fixAngle)
    #vel.stop()

   
    #ch = sys.stdin.read(1)
    #if ch == 'a':
     #print "Wohoo"
     #vel.stop()
     #time.sleep(5)
    
        
#    inputs for movement

#    head to ball, face the goal
#    [xCommand,yCommand,toGoal]

def run(data):
    #goCenter(data)
    getBall(data)

    #receives speed as qpps. The distance I didn't figure out yet. I guess it receives in cent
    #SpeedDistanceM1(128,_speed1,_distance,_buffer)
    #SpeedDistanceM2(128,_speed2,_distance,_buffer)
    #SpeedDistanceM1(129,_speed3,_distance,_buffer)
    #this did not work
    #SetM1PositionPID(128,p,i,d,kid,dead,min,max)
    #SetM2PositionPID(128,p,i,d,kid,dead,min,max)
    #SetM1PositionPID(129,p,i,d,kid,dead,min,max)
    #SpeedM1(128,)


# this is just to read values to calculate the PID, and to set the velocity
def tentative(v,p,i,d,kid,dead,min,max):
    ForwardM1(128,v)
    ForwardM2(128,v)
    ForwardM1(129,v)

    read128 = ReadMainBatteryVoltage(128)
    read129 = ReadMainBatteryVoltage(129)
    print 'readBattery128: ',read128
    print "readBattery129", read129
    logic128 = ReadLogicBatteryVoltage(128)
    logic129 = ReadLogicBatteryVoltage(129)
    print "Batterylogic128: ", logic128
    print "Batterylogic129: ", logic129
    speed128a = ReadISpeedM1(128)
    speed128b = ReadISpeedM2(128)
    speed129 = ReadISpeedM1(129)
    #SetM1VelocityPID(address,p,i,d,qpps)


    print "speed128a: ",speed128a
    print "speed128b: ",speed128b
    print "speed129:", speed129
    wheela = ReadM1VelocityPID(128)
    wheelb = ReadM2VelocityPID(128)
    wheelc = ReadM1VelocityPID(129)
    print "velocity128a",wheela
    print "velocity128b",wheelb
    print "velocity128c",wheelc
    enca = ReadEncM1(128)
    encb = ReadEncM2(128)
    encc = ReadEncM1(129)
    print "encoder 1, 2 and 3",enca,encb,encc
    time.sleep(5)
    stop()
    SetM1VelocityPID(128,p,i,d,speed128a[1])
    SetM2VelocityPID(128,p,i,d,speed128b[1])
    SetM1VelocityPID(129,p,i,d,speed129[1])
    #SetM1PositionPID(address,kp,ki,kd,kimax,deadzone,min,max):
    SetM1PositionPID(128,p,i,d,kid,dead,min,max)
    SetM2PositionPID(128,p,i,d,kid,dead,min,max)
    SetM1PositionPID(129,p,i,d,kid,dead,min,max)
    print "segunda leitura"
    read128 = ReadMainBatteryVoltage(128)
    read129 = ReadMainBatteryVoltage(129)
    print 'readBattery128: ',read128
    print "readBattery129", read129
    logic128 = ReadLogicBatteryVoltage(128)
    logic129 = ReadLogicBatteryVoltage(129)
    print "Batterylogic128: ", logic128
    print "Batterylogic129: ", logic129
    speed128a = ReadISpeedM1(128)
    speed128b = ReadISpeedM2(128)
    speed129 = ReadISpeedM1(129)
    print "speed128a: ",speed128a
    print "speed128b: ",speed128b
    print "speed129:", speed129
    wheela = ReadM1VelocityPID(128)
    wheelb = ReadM2VelocityPID(128)
    wheelc = ReadM1VelocityPID(129)
    print "velocity128a",wheela
    print "velocity128b",wheelb
    print "velocity128c",wheelc
    enca = ReadEncM1(128)
    encb = ReadEncM2(128)
    encc = ReadEncM1(129)
    print "encoder 1, 2 and 3",enca,encb,encc

def stop():
    ForwardM1(128,0)
    ForwardM2(128,0)
    ForwardM1(129,0)


def motorControl():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # node are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'talker' node so that multiple talkers can
    # run simultaneously.
    rospy.init_node('motorControl', anonymous=True)

    # This subscribes to the velTopic topic expecting the 'velocities' message
    rospy.Subscriber('coordinates', convertedCoordinates, run)
    #rospy.loginfo(msg)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()




if __name__ == '__main__':
    try:
     Open('/dev/ttySAC0', 38400)
    
    # c.setvelocity()
     c.setvelocity()
     motorControl()
    except:
     global _SERIAL_ERR
     _SERIAL_ERR = True
     #vel.stop()
   # ForwardM1(W1,10)
   # ForwardM2(W1,10)
   # ForwardM1(W2,10)
   # time.sleep(140)
    




