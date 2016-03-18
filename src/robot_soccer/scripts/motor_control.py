#!/usr/bin/env python
#import kickTime as kt
import rospy
import numpy as np
from roboclaw import *
import calibratepid as c
import kick as k
import math
import velchangers as vel
#import param
from std_msgs.msg import String
#from robot_soccer.msg import velocities
#from robot_soccer.msg import locations
from robot_soccer.msg import convertedCoordinates
#import calibratepid
#import tty, sys

sample_rate = 0.01

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


    #for P control goes to ball
    vx = k_vx*(xr-xb)
    vy = k_vy*(yr-yb)
    theta_d = math.atan2(yg-yr, xg-xr)
    omega = k_phi*(tr - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


    # vel.goXYOmegaTheta(robotX,robotY,tr)

    #kickTime(xr, toGoal, xball)

def getData(data):
    xb = data.ball_x
    yb = data.ball_y
    xr = data.home1_x
    yr = data.home1_y
    tr = data.home1_theta
    mydata=[xb,yb,xr,yr,tr]
    return mydata

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
    #print toGoal		run()
    
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

#def run(data):
    #goCenter(data)
    #getBall(data)

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
    rospy.Subscriber('coordinates', convertedCoordinates, runProgram)
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
    




