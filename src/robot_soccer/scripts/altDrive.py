import numpy as np
import roboclaw as robo
from classes import P
from PID import PID

# This is an alternative way to drive the motors based on velocity and PWM for each motor
# PWM values range from -32767 to +32767 (eg. +-100% duty).

# need to find a max value of this math and then scale it to the PWM range as an int


def velDrive(x, y, a_d, r):

    # can run predictor and path planning here for more accuracy

    directionANDangle = PID(r, x, y, a_d)   # PID control
    print('vector from PID machine')
    print(directionANDangle)

    commands = np.matrix([[directionANDangle[0]], [directionANDangle[1]], [directionANDangle[2]]])

    rotate = np.matrix([[np.cos(r[2]), np.sin(r[2]), 0.0],
                        [-np.sin(r[2]), np.cos(r[2]), 0.0],
                        [0.0, 0.0, 1.0]])
    print('commands')
    print(commands)

    # individual motor commands we may need a control gain
    OMEGA = P.M3*rotate*commands
    print('OMEGA')
    print(OMEGA)
    # use the trims to correct the motor operation
    #OMEGA = np.dot(OMEGA,trims)

    OMEGAasINT = np.matrix([[20000], [20000], [0]])
    #print('OMEGAasINT')
    #print(OMEGAasINT)
    #OMEGAasINT[0] = int(round(OMEGA[0]))
    #OMEGAasINT[1] = int(round(OMEGA[1]))
    #MEGAasINT[2] = int(round(OMEGA[2]))
    print('OMEGAasINT')
    print(OMEGAasINT)

    robo.DutyM1M2(128, OMEGAasINT[0], OMEGAasINT[1])
    robo.DutyM1M2(129, OMEGAasINT[2], 0)


def stop():
    robo.DutyM1M2(128, 0, 0)
    robo.DutyM1M2(129, 0, 0)



