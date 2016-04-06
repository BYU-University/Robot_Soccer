#!/usr/bin/env python

from functools import partial
import roboclaw as r
import time
import math
WF=0x80
WB=0x81
ALLWHEELS=3
SPEED_MAX = 127
SPEED_MIN = 0

M1 = 0
M2 = 1
M3 = 2
radius=2 #radius from center to center wheel
count=0
#w=0
#theta = -math.pi/3.0
#r1y = math.sin(theta -w)*r*speed
#r2y = math.sin(theta+w)*r+speed
#r3y = math.sin(w)*r*speed

_RC = [
		{ 'addr': 128, 'wheel': 'M1' }, # M1
		{ 'addr': 129, 'wheel': 'M1' }, # M2
		{ 'addr': 128, 'wheel': 'M2' }, # M3
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
   r.ForwardM1(WF,0)
   r.ForwardM2(WF,0)
   r.ForwardM1(WB,0)

def calibrateRoboclaws():
    p = int(65536 * 4)
    i = int(65536 * 2)
    d = int(65536 * 6)
    #last good calibration readings
    voltage = 16.9 # 16.7   # 15.7   # 15.9   # 15.9   # 15.8   # 16.5   # 16.5   # 15.9   # 15.9   # 15.5   # 15.3   # 16.6   # 15.5
    qqps_m1 = 142977 # 141606 # 118234 # 129122 # 136502 # 140181 # 146772 # 130185 # 146330 # 149353 # 137669 # 141136 # 148132 # 149287
    qqps_m2 = 178091 # 187808 # 139632 # 159086 # 164265 # 164244 # 177244 # 180669 # 180616 # 166407 # 172434 # 165175 # 168984 # 169069
    qqps_m3 = 195319 # 175863 # 130377 # 154211 # 171489 # 165285 # 183906 # 181536 # 175021 # 170281 # 159700 # 161999 # 165146 # 164071

    read_v = r.ReadMainBatteryVoltage(0x80)
    read_1 = read_v[0]/10
    if (read_1 == 0):
	read_1 = 1
    scale = lambda x: int(x*voltage/read_1)
    
    speedM1 = scale(qqps_m1)
    speedM2 = scale(qqps_m2)
    speedM3 = scale(qqps_m3)
    
    r.SetM1VelocityPID(0x80,p,i,d,speedM1)
    r.SetM2VelocityPID(0x80,p,i,d,speedM2)
    r.SetM1VelocityPID(0x81,p,i,d,speedM3)


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

	

def quad(speed):
	theta = -math.pi/3
	count = 0
	w=0
	neg=-1
	while count < 8:
	#	r1y = int(math.sin(theta-w)*radius*speed)
    #	r2y = int(math.sin(theta+w)*radius*speed)
	#	r3y = int(math.sin(w)*radius*speed)
		time.sleep(1)
		r.ForwardM1(WF,20)
	    r.ForwardM2(WF,20)
		r.ForwardM1(WB,20)
        time.sleep(1)
		stop()
		w=(math.pi/3)+w
		#print "speed", r1y,r2y,r3y
		print "omega", w
		count = count + 1
		stop()



def init(set_PID=True):
	try:
		r.Open('/dev/ttySAC0', 38400)
		quad(20)
		#time.sleep(5)
		#quad(0)
		#stop()
		
	except:
		global _SERIAL_ERR
		_SERIAL_ERR = True


if __name__ == '__main__':
	init(True)


