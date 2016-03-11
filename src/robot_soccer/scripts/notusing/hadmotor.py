#!/usr/bin/env python
import roboclaw as r
from functools import partial
#import roboclaw_read as rr 
import time
import math
WF=0x80
WB=0x81
ALLWHEELS=3
_SPEED_MAX = 127
_SPEED_MIN = 0

M1 = 0
M2 = 1
M3 = 2
radius=2 #radius from center to center wheel
#w=0
#theta = -math.pi/3.0
#r1y = math.sin(theta -w)*r*speed
#r2y = math.sin(theta+w)*r+speed
#r3y = math.sin(w)*r*speed

_RC = [
		{ 'addr': 0x80, 'wheel': 'M1' }, # M1
		{ 'addr': 0x81, 'wheel': 'M1' }, # M2
		{ 'addr': 0x80, 'wheel': 'M2' }, # M3
	 ]
_SERIAL_ERR = False

def __dummy(*args):
	return False


def _getFunction(func_str, wheel_id):
	"""Get Function
	"""
	# If there was a serial error, it probably wasn't open
	# so don't return an actual roboclaw command, but a dummy function
	if _SERIAL_ERR:
		return __dummy

	# Based on the wheel_id, get the correct roboclaw address and wheel
	wheel_str = _RC[wheel_id]['wheel']
	addr = _RC[wheel_id]['addr']

	# Using the func_str build the correct roboclaw method
	func_str = func_str.format(wheel_str)

	# Go get the correct method from the 'r' module
	func = getattr(r, func_str)
	
	return partial(func,addr)
	


def spin(speed,speed2):
        r.SpeedM1(WF,speed)
        r.SpeedM2(WF,speed)
        r.SpeedM1(WB,speed2)

def slowspin(speed,speed2):
	r.ForwardM1(WF,speed)
	r.BackwardM2(WF,speed)
	r.ForwardM1(WB,speed2)
	time.sleep(4)
	stop()

#def displaySpeed():
#	rr.displayspeed()
	
def stop():
   for wheel_id in range(ALLWHEELS):
	Forward(wheel_id, 0)
	Speed(wheel_id, 0)

def Forward(wheel_id, speed):
	func = _getFunction('Forward{}', wheel_id)
	return func(speed)

def Backward(wheel_id, speed):
	func = _getFunction('Backward{}', wheel_id)
	return func(speed)


def left(speed):
	r.ForwardM1(WF,speed)
	r.ForwardM2(WF,speed)
	time.sleep(4)
	r.ForwardM1(WF,speed-10)
	r.ForwardM2(WF,speed-10)
	r.ForwardM1(WB,speed+5)
	time.sleep(1)
	r.ForwardM1(WB,0)
	r.ForwardM1(WF,speed)
        r.ForwardM2(WF,speed)
	time.sleep(2)
	stop()

def back(speed):
        r.BackwardM1(WF,speed)
        r.BackwardM2(WF,speed)
        time.sleep(4)
        r.BackwardM1(WF,speed-10)
        r.BackwardM2(WF,speed-10)
        r.BackwardM1(WB,speed+5)
        time.sleep(1)
        r.ForwardM1(WB,0)
        r.ForwardM1(WF,speed)
        r.ForwardM2(WF,speed)
        time.sleep(2)
        stop()

def ReadSpeed(wheel_id):
	func = _getFunction('ReadSpeed{}', wheel_id)
	return func()

def ResetEncoders(wheel_id):
	func = _getFunction('ResetEncoders', wheel_id)
	return func()

def ReadEnc(wheel_id):
	func = _getFunction('ReadEnc{}', wheel_id)
	return func()
	

def quad(speed):
	w=0
	theta = -math.pi/3
	count = 0
	n=2
	w=0
	neg=-1
	while count<8:
		r1y = int(math.sin(theta-w)*radius*speed)
	#	r1y=(r1*r1)/2
        	r2y = int(math.sin(theta+w)*radius*speed*neg)
	#	r2y=(r2*r2)/2
	        r3y = int(math.sin(w)*radius*speed)
	#	r3y=(r3*r3)/2
	#	stop()
	#	time.sleep(1)
		r.ForwardM1(WF,r1y)
	        r.ForwardM2(WF,r2y)
		r.ForwardM1(WB,r3y)
        	time.sleep(1)
		stop()
		w=(math.pi/3)+w
		print "speed", r1y,r2y,r3y
		print "omega", w
		count=count+1
		stop()
	return count


def init(set_PID=True):
	try:
		r.Open('/dev/ttySAC0', 460800)
	except:
		global _SERIAL_ERR
		_SERIAL_ERR = True

