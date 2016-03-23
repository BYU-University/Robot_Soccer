#!/usr/bin/env python
from roboclaw import *
import velchangers
import time
Open('/dev/ttySAC0', 38400)

#this is the calc made on motor_control->tentative
#M1speed = 100
M1speed = 278700
#M2speed = 100
M2speed = 253800
#M3speed = 100
M3speed = 269400
p = 4.0
i = 2.0
#i = 0.0
d = 6.0999908447265625
#q = 100
q = 308419


def forward(speed):
		ForwardM1(128,speed)
		ForwardM2(128,speed)
		ForwardM1(129,speed)

def stop():
	def forward():
		ForwardM1(128,0)
		ForwardM2(128,0)
		ForwardM1(129,0)
'''
print ReadM1VelocityPID(128)
p1,i1,d1,q1,t1 = ReadM1VelocityPID(128)
#print ReadMainBatteryVoltage()
#p1,i1,d1,q1 = readM1pidq(128)
print "128 M1 P=%.2f" % (p/65536.0)
print "128 M1 I=%.2f" % (i/65536.0)
print "128 M1 D=%.2f" % (d/65536.0)
print "128 M1 QPPS=",q
p2,i2,d2,q2,t2 = ReadM2VelocityPID(128)
#p2,i2,d2,q2 = readM2pidq(128)
print "128 M2 P=%.2f" % (p2/65536.0)
print "128 M2 I=%.2f" % (i2/65536.0)
print "128 M2 D=%.2f" % (d2/65536.0)
print "128 M2 QPPS=",q2
p3,i3,d3,q3,t3 = ReadM1VelocityPID(129)
#p3,i3,d3,q3 = readM1pidq(129)
print "121 M1 P=%.2f" % (p3/65536.0)
print "129 M1 I=%.2f" % (i3/65536.0)
print "129 M1 D=%.2f" % (d3/65536.0)
print "129 M1 QPPS=",q3

def forward():
		ForwardM1(128,20)
		ForwardM2(128,20)
		ForwardM1(129,20)
def stop():
  		ForwardM2(128,0)
	  	ForwardM1(128,0)
		ForwardM1(129,0)
 
def read(addr,motor):
		samples = 3
  		result = 0
  		for i in range(0, samples):
			#print "cheking for"
	    		sample = 0
    			if motor == 1:
      				sample = ReadSpeedM1(addr)
    			elif motor == 2:
      				sample = ReadSpeedM2(addr)
    			print sample
			#print result
    			result = result + int(sample[1])
			print 'result = ', result
  			result = result/samples
			print 'result = ', result
 		return result
def go():  
		speed = 127		
		#ForwardM1=0
		speedM1Backward=0
		speedM1Forward=0
		speedM2Forward=0
		speedM2Backward=0
		speedM3Forward=0
		speedM3Backward=0

		if speed < -127:
			speed = -127
		if speed > 127:
			speed = 127

#stop();

#Forwards
		BackwardM1(128,speed); #M1 backward sample 1
		ForwardM2(128,speed); #M2 forward sample 1
		time.sleep(0.2)

		speedM1Backward=speedM1Backward+read(128,1)
		speedM2Forward=speedM2Forward+read(128,2)

		stop();
		time.sleep(0.2);

#Backwards
		ForwardM1(128,speed); #M1 forward sample 1
		BackwardM2(128,speed); #M2 backward sample 1
		time.sleep(0.2)
		
		speedM1Forward=speedM1Forward+read(128,1)
		speedM2Backward=speedM2Backward+read(128,2)

		stop();
		time.sleep(0.1);

#Left back
		BackwardM2(128,speed); #M2 backward sample 2 
		ForwardM1(129,speed); #M3 forward sample 1
		time.sleep(0.2)

		speedM2Backward=speedM2Backward+read(128,2)
		speedM2Backward=speedM2Backward/2
		speedM3Forward=speedM3Forward+read(129,1)

		stop();
		time.sleep(0.1);

#Left forward
		ForwardM2(128,speed); #M2 forward sample 2
		BackwardM1(129,speed); #M3 backward sample 1
		time.sleep(0.2)

		speedM2Forward=speedM2Forward+read(128,2)
		speedM2Forward=speedM2Forward/2
		speedM3Backward=speedM3Backward+read(129,1)

		stop();
		time.sleep(0.1);

# RightBack
		ForwardM1(128,speed); #M1 forward sample 2
		BackwardM1(129,speed); #M3 backward sample 2
		time.sleep(0.2)

		speedM1Forward=speedM1Forward+read(128,1)
		speedM1Forward=speedM1Forward/2
		speedM3Backward=speedM3Backward+read(129,1)
		speedM3Backward=speedM3Backward/2
		speedM2Backward=speedM2Backward+read(128,1)
		speedM2Backward=speedM2Backward/2
		

		stop();
		time.sleep(0.1);

# Right Forward
		BackwardM1(128,speed); #M1 backward sample 2
		ForwardM1(129,speed); #M3 forward sample 2
		time.sleep(0.2)

		speedM1Backward=speedM1Backward+read(128,1)
		speedM1Backward=speedM1Backward/2
		speedM3Forward=speedM3Forward+read(129,1)
		speedM3Forward=speedM3Forward/2

		#stop();

		speedM1Forward=(speedM1Forward*127)/speed
		speedM1Backward=(speedM1Backward*127)/speed
		speedM2Forward=(speedM2Forward*127)/speed
		speedM2Backward=(speedM2Backward*127)/speed
		speedM3Forward=(speedM3Forward*127)/speed
		speedM3Backward=(speedM3Backward*127)/speed

		print 'speedM1Forward',speedM1Forward;
		print 'speedM1Backward',speedM1Backward;
		print 'speedM2Forward',speedM2Forward;
		print 'speedM2Backward',speedM2Backward;
		print 'speedM3Forward',speedM3Forward;
		print 'speedM3Backward',speedM3Backward;

		speedM1 = (speedM1Forward - speedM1Backward)/2
		speedM2 = (speedM2Forward - speedM2Backward)/2
		speedM3 = (speedM3Forward - speedM3Backward)/2

		
		#SetM1VelocityPID(128,p1,i1,d1,speedM1)
		#SetM2VelocityPID(128,p2,i2,d2,speedM2)
		#SetM1VelocityPID(129,p3,i3,d3,speedM3)
		
				

		p1,i1,d1,q1,t1 = ReadM1VelocityPID(128)
		print "128 M1 P=%.2f" % (p1/65536.0)
		print "128 M1 I=%.2f" % (i1/65536.0)
		print "128 M1 D=%.2f" % (d1/65536.0)
		print "128 M1 QPPS=",q1
		p2,i2,d2,q2,t2 = ReadM2VelocityPID(128)
		print "128 M2 P=%.2f" % (p2/65536.0)
		print "128 M2 I=%.2f" % (i2/65536.0)
		print "128 M2 D=%.2f" % (d2/65536.0)
		print "128 M2 QPPS=",q2
		p3,i3,d3,q3,t3 = ReadM1VelocityPID(129)
		print "129 M1 P=%.2f" % (p3/65536.0)
		print "129 M1 I=%.2f" % (i3/65536.0)
		print "129 M1 D=%.2f" % (d3/65536.0)
		print "129 M1 QPPS=",q3
		
		print "P D=%.2f" % p
		print "P D=%.2f" % i
		print "P D=%.2f" % d
'''
def setvelocity():
		SetM1VelocityPID(128,p,i,d,M1speed)
		SetM2VelocityPID(128,p,i,d,M2speed)
		SetM1VelocityPID(129,p,i,d,M3speed)
		print "printing the values of p, i ,d :",p,i,d
		#stop();


def calibration(p,i,d,speedM):
		SetM1VelocityPID(128,p,i,d,speedM)
		SetM2VelocityPID(128,p,i,d,speedM)
		#SetM1VelocityPID(129,p,i,d,speedM)

def setSeed(speed):
	SpeedM1(128,speed)
	SpeedM2(128,speed)
	#SpeedM1(129,speed)