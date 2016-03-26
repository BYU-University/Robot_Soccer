#!/usr/bin/env python
from roboclaw import *
import math
import mat


DEBUG = True
cap = .5


def radianToQpps(radian):
  result = int(radian * 19820.0 / (2.0*math.pi))
  if result > 308420: #max velocity (127) in Qpps
    return 308420
  elif result < -308420:
    return -308420
  else:
    return result

    
#def qppsToRadian(qpps):
#  result = int((qpps[0] / 19820.0) * (2.0*math.pi))
#  return result
'''
def goXYOmega(x,y,omega,limit=False):
  #if limit:
   # total = math.sqrt(float(x**2+y**2))
   # if total > cap:
      #scale = cap / total
     # x = x * scale
     # y = y * scale
  v1,v2,v3 = mat.getWheelVel(x,y,omega)
  s1 = radianToQpps(v1)
  s2 = radianToQpps(v2)
  s3 = radianToQpps(v3)
  #SpeedM1(128,s1)
  #SpeedM2(128,s2)
  #SpeedM1(129,s3)
  print "values for v1,v2,v3: ",v1,v2,v3
  print " ....."
  print "values for s1,s2,s2 speed",s1,s2,s3
'''

#function to use. This functions will get current info to go...
def goXYOmega(x,y,Omega):
  #if limit:
  total = math.sqrt(float(x**2+y**2))
  if total > cap:
   scale = cap / total
   #print "this is the scale",scale
   x = x *scale
   y = y *scale
  v1,v2,v3 = mat.getWheelVelOmega(x,y,Omega)
  s1 = radianToQpps(v1)
  s2 = radianToQpps(v2)
  s3 = radianToQpps(v3)
  print "values for v2,v2,v3: ",v1,v2,v3
  print "....."
  print "values for s1,s2,s2 for speed: ",s1,s2,s3
  SpeedM1(128,s1)
  SpeedM2(128,s2)
  SpeedM1(129,s3)

'''
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
  #SpeedAccelM1(128,int(abs(s1)/time),s1)
  #SpeedAccelM2(128,int(abs(s2)/time),s2)
  #SpeedAccelM1(129,int(abs(s3)/time),s3)
  #s1_prev=s1
  #s2_prev=s2
  #s3_prev=s3

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
'''

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