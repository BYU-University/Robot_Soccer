import roboclaw as r
from functools import partial
import functools
import time
import math
WF=0x80
WB=0x81
ALLWHEELS = 3

radius=2 #radius from center to center wheel
#w=0
#theta = -math.pi/3.0
#r1y = math.sin(theta -w)*r*speed
#r2y = math.sin(theta+w)*r+speed
#r3y = math.sin(w)*r*speed


_SPEED_MAX = 127
_SPEED_MIN = 0

M1 = 0
M2 = 1
M3 = 2

_RC = [
		{ 'addr': 0x80, 'motor': 'M1' }, # M1
		{ 'addr': 0x81, 'motor': 'M1' }, # M2
		{ 'addr': 0x80, 'motor': 'M2' }, # M3
	 ]

_SERIAL_ERR = False

#class QPPS:
#	M1 = 198970
#	M2 = 170489
#	M3 = 171568

def __dummy(*args):
	return False

def _getFunction(func_str, motor_id):
	"""Get Function
	"""
	if _SERIAL_ERR:
		return __dummy
	motor_str = _RC[motor_id]['motor']
	addr = _RC[motor_id]['addr']
	func_str = func_str.format(motor_str)
	func = getattr(r, func_str)
	# Return a curried version of func, with the address already applied
	return partial(func, addr)
#def _map(x, in_min, in_max, out_min, out_max):
#	"""Map
#	Takes in a value x and maps it from one range to another
#	"""
#	return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min


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


def Forward(motor_id, speed):
	func = _getFunction('Forward{}', motor_id)
	return func(speed)


def Backward(motor_id, speed):
	func = _getFunction('Backward{}', motor_id)
	#speed = _map(speed, 0, 100, _SPEED_MIN, _SPEED_MAX)
	return func(speed)

#def Speed(motor_id, speed):
#	func = _getFunction('Speed{}', motor_id)
#	return func(speed)

def ReadSpeed(motor_id):
	func = _getFunction('ReadSpeed{}', motor_id)
	return func()

#def ReadVelocityPID(motor_id):
#	func = _getFunction('Read{}VelocityPID', motor_id)
#	return func()

#def SetVelocityPID(motor_id, p, i, d, q):
#	func = _getFunction('Set{}VelocityPID', motor_id)
#	return func(p, i, d, q)

#def UpdateVelocityPID(motor_id, p=None, i=None, d=None, q=None):
#	s,_p,_i,_d,_q = ReadVelocityPID(motor_id)
#	vals = [_p,_i,_d,_q]
#	new_vals = [p,i,d,q]

	# Only update the p,i,d,q values that are not None
#	for i in range(len(new_vals)):
#		if new_vals[i]:
#			vals[i] = new_vals[i]

#	return SetVelocityPID(motor_id,vals[0],vals[1],vals[2],vals[3])

#def ResetEncoders(motor_id):
#	func = _getFunction('ResetEncoders', motor_id)
#	return func()

def ReadEnc(motor_id):
	func = _getFunction('ReadEnc{}', motor_id)
	return func()

#def ReadMainBatteryVoltage():
#	motor_id = M1 	# This doesn't matter since both RoboClaws
					# are connected to the same battery
#	func = _getFunction('ReadMainBatteryVoltage', motor_id)
#	return func()

#def SpeedAccel(motor_id, accel, speed):
#	func = _getFunction('SpeedAccel{}', motor_id)
#	return func(accel, speed)

def stop():
   	for wheel_id in range(ALLWHEELS):
		Forward(wheel_id, 0)
		Speed(wheel_id, 0)

def init(set_PID=True):
	try:
		r.Open('/dev/ttySAC0', 460800)
	except:
		global _SERIAL_ERR
		_SERIAL_ERR = True


#	if set_PID:
		# M1QPPS = 198970 #380268 #180000 #12764
		# M2QPPS = 170489 #302420 #241547 #12764
		# M3QPPS = 171568 #411356 #180000 #12764

		# PID stuff here?
#		SetVelocityPID(0, 3.991973876953125, 1.9959869384765625, 5.969512939453125, QPPS.M1)
#		SetVelocityPID(1, 3.991973876953125, 1.9959869384765625, 5.969512939453125, QPPS.M2)
#		SetVelocityPID(2, 3.991973876953125, 1.9959869384765625, 5.969512939453125, QPPS.M3)
		# SetVelocityPID(2, 0.0152587890625,   0.6103515625,       0.249481201171875, M3QPPS)
