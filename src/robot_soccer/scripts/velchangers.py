#!/usr/bin/env python
from roboclaw import *
import math
import mat


DEBUG = True
cap = .3

def radianToQpps(radian):
  result = int(radian * 19820.0 / (2.0*math.pi))
  if result > 308420: #max velocity (127) in Qpps
    return 308420
  elif result < -308420:
    return -308420
  else:
    #result4 = result
    return result
#14509.47)#

#def radianToQpps(radian):
#  result = int(radian * 19820.0 / (2*math.pi))
  #print result 
#  if result > 31471:
#    return 31471
#  elif result < -31498:
#    return -31498
 # elif result < -23876:
  #  return -23876
  #elif result < 22034:
#	return 22034
#  else:
 #   return result
    
#def qppsToRadian(qpps):
#  result = int((qpps[0] / 19820.0) * (2.0*math.pi))
#  return result

def goXYOmega(x,y,omega,limit=False):
  if limit:
    total = math.sqrt(float(x**2+y**2))
    if total > cap:
      scale = cap / total
      x = x * scale
      y = y * scale
  v1,v2,v3 = mat.getWheelVel(x,y,omega)
  s1 = radianToQpps(v1)
  s2 = radianToQpps(v2)
  s3 = radianToQpps(v3)
  SpeedM1(128,s1)
  SpeedM2(128,s2)
  SpeedM1(129,s3)

def goXYOmegaTheta(x,y,omega,theta,limit=False):
  if limit:
    total = math.sqrt(float(x**2+y**2))
    if total > cap:
      scale = cap / total
      x = x * scale
      y = y * scale
  v1,v2,v3 = mat.getWheelVelTheta(x,y,omega,theta)
  s1 = radianToQpps(v1)
  s2 = radianToQpps(v2)
  s3 = radianToQpps(v3)
  SpeedM1(128,s1)
  SpeedM2(128,s2)
  SpeedM1(129,s3)
  
def goXYOmegaAccel(x,y,theta):
  v1,v2,v3 = mat.getWheelVel(x,y,theta)
  time = 1
  s1 = radianToQpps(v1)
  s2 = radianToQpps(v2)
  s3 = radianToQpps(v3)
  r1 = ReadSpeedM1(128)
  r2 = ReadSpeedM2(128)
  r3 = ReadSpeedM1(129)
  
  #if DEBUG:
  print "This is for DEBUG ONLY OK!"
  print 'r1',r1
  print 'r2',r2
  print 'r3',r3
  print 's1',s1
  print 's2',s2
  print 's3',s3
    
  #Ac=  
  SpeedAccelM1(128,int(abs(s1)/time),s1)
  SpeedAccelM2(128,int(abs(s2)/time),s2)
  SpeedAccelM1(129,int(abs(s3)/time),s3)
  s1_prev=s1
  s2_prev=s2
  s3_prev=s3

def smoothStop(v1_1,v2_1,v3_1,v1_2,v2_2,v3_2):
  s1 = radianToQpps(v1_1)
  s2 = radianToQpps(v2_1)
  s3 = radianToQpps(v3_1)
  SpeedAccelM1(128,abs(s1*3),s1)
  SpeedAccelM2(128,abs(s2*3),s2)
  SpeedAccelM1(129,abs(s3*3),s3)
  time.sleep(.5)
  SpeedAccelM1(128,abs(s1*3),0)
  SpeedAccelM2(128,abs(s2*3),0)
  SpeedAccelM1(129,abs(s3*3),0)
  time.sleep(.5)
  s1 = radianToQpps(v1_2)
  s2 = radianToQpps(v2_2)
  s3 = radianToQpps(v3_2)
  SpeedAccelM1(128,abs(s1*3),s1)
  SpeedAccelM2(128,abs(s2*3),s2)
  SpeedAccelM1(129,abs(s3*3),s3)
  time.sleep(.5)
  SpeedAccelM1(128,abs(s1*3),0)
  SpeedAccelM2(128,abs(s2*3),0)
  SpeedAccelM1(129,abs(s3*3),0)
  time.sleep(.5)
  
def leftTurnMomentum():
  goXYOmegaAccel(1.0,0.0,0.0)
  time.sleep(5)
  goXYOmegaAccel(-3.0,-1.0,0.0)
  time.sleep(2)
  goXYOmegaAccel(0.0,-1.0,0.0)
  time.sleep(5)
  goXYOmegaAccel(0,0,0)
 # goXYOmegaAccel(0,0,0,0)


def testrun(x,y,theta):
  goXYOmega(x,y,theta,'false')
  #goXYOmegaAccel(x,y,theta)
  #time.sleep(3)
  #stop()
  #time.sleep(5)
  

def leftTurn():
  goXYOmegaAccel(-0.4,0,0.0)
  time.sleep(2)
  goXYOmegaAccel(0.0,-5.0,0.0)
  time.sleep(0.3)
  goXYOmegaAccel(-1.4,0,0.0)
  time.sleep(1)
  goXYOmegaAccel(0,0,0)
  

def printState():
  r1 = ReadSpeedM1(128)
  r2 = ReadSpeedM2(128)
  r3 = ReadSpeedM1(129)
  print 'r1',r1
  print 'r2',r2
  print 'r3',r3
  #v1 = qppsToRadian(r1)
  #v2 = qppsToRadian(r2)
  #v3 = qppsToRadian(r3)
  #x,y,omega = mat.getXYOmega(v1,v2,v3)
  #print "X=%f" % x
  #print "Y=%f" % y
  #print "O=%f" % omega




def init():
  try:
    Open('/dev/ttySAC0', 38400)
  except:
    global _SERIAL_ERR
    _SERIAL_ERR = True

def stop():
   ForwardM1(128,0)
   ForwardM2(128,0)
   ForwardM1(129,0)

#def calibrateRoboclaws():
#    p = int(65536 * 4)
#    i = int(65536 * 2)
#    d = int(65536 * 6)
    #last good calibration readings
 #   voltage = 16.9 # 16.7   # 15.7   # 15.9   # 15.9   # 15.8   # 16.5   # 16.5   # 15.9   # 15.9   # 15.5   # 15.3   # 16.6   # 15.5
 #   qqps_m1 = 142977 # 141606 # 118234 # 129122 # 136502 # 140181 # 146772 # 130185 # 146330 # 149353 # 137669 # 141136 # 148132 # 149287
 #   qqps_m2 = 178091 # 187808 # 139632 # 159086 # 164265 # 164244 # 177244 # 180669 # 180616 # 166407 # 172434 # 165175 # 168984 # 169069
 #   qqps_m3 = 195319 # 175863 # 130377 # 154211 # 171489 # 165285 # 183906 # 181536 # 175021 # 170281 # 159700 # 161999 # 165146 # 164071

  #  read_v = ReadMainBatteryVoltage(128)
  #  read_1 = read_v[0]/10
  #  if (read_1 == 0):
  #	read_1 = 1
   # scale = lambda x: int(x*voltage/read_1)
    
    #speedM1 = scale(qqps_m1)
    #speedM2 = scale(qqps_m2)
    #speedM3 = scale(qqps_m3)
    
    #SetM1pidq(128,p,i,d,speedM1)
    #SetM2pidq(128,p,i,d,speedM2)
    #SetM1pidq(129,p,i,d,speedM3)
    #SetM1VelocityPID(128,p,i,d,speedM1)
    #SetM2VelocityPID(128,p,i,d,speedM2)
    #SetM1VelocityPID(129,p,i,d,speedM1)

#if __name__ == '__main__':
  
  #smoothStop(v1_1,v2_1,v3_1,v1_2,v2_2,v3_2)
  #smoothStop(v1_3,v2_3,v3_3,v1_4,v2_4,v3_4)
  #goXYOmegaAccel(0.0,1.0*2,.5*2,1)
  #time.sleep(1)
  #goXYTheta(0.0,1.0*2,.23*2)
  #time.sleep(3
 # try:
 #   Open('/dev/ttySAC0', 38400)
 # except:
 #   global _SERIAL_ERR
 #   _SERIAL_ERR = True
  
  #calibrateRoboclaws()
  #print read_v
  #goXYOmegaAccel(0.0,0.0,0.0,1)
  #leftTurn()
 # goXYOmegaAccel(0,-1,.117907,.5)
  
  #for i in range(0,9):
  #  time.sleep(.5)
  #printState()
  
  #stop()  
  #goXYOmegaAccel(0,0,0,.5)
#s1 = radianToQpps(v1)
#s2 = radianToQpps(v2)
#s3 = radianToQpps(v3)
#r1 = ReadSpeedM1(0x80)
#r2 = ReadSpeedM2(0x80)
#r3 = ReadSpeedM1(0x81)
#SpeedAccelM1(0x80,int(abs(r1-s1)),s1)
#SpeedAccelM2(0x80,int(abs(r2-s2)),s2)
#SpeedAccelM1(0x81,int(abs(r3-s3)),s3)
#time.sleep(1)
#
#v1,v2,v3 = mat.getWheelVel(0.0,-1.0,0.0)
#s1 = radianToQpps(v1)
#s2 = radianToQpps(v2)
#s3 = radianToQpps(v3)
#r1 = ReadSpeedM1(0x80)
#r2 = ReadSpeedM2(0x80)
#r3 = ReadSpeedM1(0x81)
#SpeedAccelM1(0x80,int(abs(r1-s1)),s1)
#SpeedAccelM2(0x80,int(abs(r2-s2)),s2)
#SpeedAccelM1(0x81,int(abs(r3-s3)),s3)
#time.sleep(1)
#
#v1,v2,v3 = mat.getWheelVel(-1.0,0.0,0.0)
#s1 = radianToQpps(v1)
#s2 = radianToQpps(v2)
#s3 = radianToQpps(v3)
#r1 = ReadSpeedM1(0x80)
#r2 = ReadSpeedM2(0x80)
#r3 = ReadSpeedM1(0x81)
#SpeedAccelM1(0x80,int(abs(r1-s1)),s1)
#SpeedAccelM2(0x80,int(abs(r2-s2)),s2)
#SpeedAccelM1(0x81,int(abs(r2-s3)),s3)
#time.sleep(1)
#
#v1,v2,v3 = mat.getWheelVel(0.0,1.0,0.0)
#s1 = radianToQpps(v1)
#s2 = radianToQpps(v2)
#s3 = radianToQpps(v3)
#r1 = ReadSpeedM1(0x80)
#r2 = ReadSpeedM2(0x80)
#r3 = ReadSpeedM1(0x81)
#SpeedAccelM1(0x80,int(abs(r1-s1)),s1)
#SpeedAccelM2(0x80,int(abs(r2-s2)),s2)
#SpeedAccelM1(0x81,int(abs(r3-s3)),s3)
#time.sleep(1)
#
#r1 = ReadSpeedM1(0x80)
#r2 = ReadSpeedM2(0x80)
#r3 = ReadSpeedM1(0x81)
#SpeedAccelM1(0x80,int(abs(r1)),0)
#SpeedAccelM2(0x80,int(abs(r2)),0)
#SpeedAccelM1(0x81,int(abs(r3)),0)
#
#time.sleep(1)

#while True:
#	time.sleep(1)
#	print "M1"
#	print ReadSpeedM1(0x80)
#	print "M2"
#	print ReadSpeedM2(0x80)
