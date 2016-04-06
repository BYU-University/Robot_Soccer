#!/usr/bin/env python
from roboclaw import *
import velchangers
import time
Open('/dev/ttySAC0', 38400)

#this is the calc made on motor_control->tentative
#M1speed = 100
M1speed = 294613
#M2speed = 100
M2speed = 283401
#M3speed = 100
M3speed = 298275
p = 4.0
i = 2.0
#i = 0.0
d = 6.0999908447265625
#q = 100
q = 308419
#


def forward(speed):
		ForwardM1(128,speed)
		ForwardM2(128,speed)
		ForwardM1(129,speed)

def stop():
	def forward():
		ForwardM1(128,0)
		ForwardM2(128,0)
		ForwardM1(129,0)

def setvelocity():
		SetM1VelocityPID(128,p,i,d,M1speed)
		SetM2VelocityPID(128,p,i,d,M2speed)
		SetM1VelocityPID(129,p,i,d,M3speed)
		print "printing the values of p, i ,d :",p,i,d
		#stop();


def calibration(p,i,d,speedM):
		SetM1VelocityPID(128,p,i,d,speedM)
		SetM2VelocityPID(128,p,i,d,speedM)
		SetM1VelocityPID(129,p,i,d,speedM)

def setSpeed(speed):
	SpeedM1(128,speed)
	SpeedM2(128,speed)
	SpeedM1(129,speed)