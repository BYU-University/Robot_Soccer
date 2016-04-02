#!/usr/bin/python
from numpy import matrix
from numpy import linalg
import math

#define s1,s2,s3

realWorldOffset = 1 #1.698
s = .0282977488817 #radius of wheel
r = .092 #radius from center to center of wheel

r1theta = -math.pi/3.0
r1x = math.cos(r1theta)*r
r1y = math.sin(r1theta)*r
r2theta = math.pi/3.0
r2x = math.cos(r2theta)*r
r2y = math.sin(r2theta)*r
r3theta = math.pi
r3x = math.cos(r3theta)*r
r3y = math.sin(r3theta)*r

print "this prints info from Mat values of r1,r2,r3 in x,y direction"
print r1x
print r1y
print r2x
print r2y
print r3x
print r3y
print "finish printing the directions"
s1theta = r1theta - math.pi/2
s1x = math.cos(s1theta)
s1y = math.sin(s1theta)

s2theta = r2theta - math.pi/2
s2x = math.cos(s2theta)
s2y = math.sin(s2theta)

s3theta = r3theta - math.pi/2
s3x = math.cos(s3theta)
s3y = math.sin(s3theta)

print "here for s1,s2,s3 in x,y direction"
print s1x
print s1y
print s2x
print s2y
print s3x
print s3y

mSub = matrix( [[s1x,s1y,(s1y*r1x - s1x*r1y)],
                [s2x,s2y,(s2y*r2x - s2x*r2y)],
                [s3x,s3y,(s3y*r3x - s3x*r3y)]] )
                
print "this is the MSub MAtrix",mSub

M = realWorldOffset*(1.0/s)*mSub

#this is the rotation matrix where turns in the x and y directions
R = lambda theta: matrix( [[math.cos(theta),math.sin(theta),0.0],
             [-math.sin(theta),math.cos(theta),0.0],
             [0.0,0.0,1.0]] )


print "this is the M value:", M

#here starts the defs

#this return a tuple with x, y, omega(or theta)
def getRobotXYOmega(x,y,omega,theta):
  desired = matrix( [[x],
                     [y],
                     [omega]] )
  desired = R(theta)*desired
  return desired
'''
def getRobotXYOmega(x,y,omega):
  #for now, I changed omega=0
  omegaZero = 0
  desired = matrix( [[x],
                     [y],
                     [omegaZero]] )
  desired = R(omega)*desired
  return desired
'''
def getWheelVel(x,y,omega):
  desired = matrix( [[x],
                     [y],
                     [omega]] )

  result = M*desired

  return result.getA()[0][0], result.getA()[1][0], result.getA()[2][0]


def getWheelVelTheta(x,y,omega,theta):
  desired = getRobotXYOmega(x, y, omega, theta)

  result = M*desired

  return result.getA()[0][0], result.getA()[1][0], result.getA()[2][0]


def getRobotXYOmegaTheta(x,y,omega,theta):

  desired = matrix( [[x],
                     [y],
                     [omega]] )
  desired = R(theta)*desired
  #print "this is GetRobotXYOmega",desired
  return desired

def getWheelVelOmega(x,y,Omega):
  desired = getRobotXYOmega(x, y,Omega)
  result = M*desired
  #print "this is getRobotXYOMEGAASTuple",result
  return result.getA()[0][0], result.getA()[1][0], result.getA()[2][0]


