from controller import *
import numpy as np

# This is an alternative way to drive the motors based on velocity and PWM for each motor
# PWM values range from -32767 to +32767 (eg. +-100% duty).


# need to find a max value of this math and then scale it to the PWM range as an int


def velDrive(x, y, a_d, r):

    # can run predictor and path planning here for more accuracy

    directionANDangle = PID(r, x, y, a_d)   # PID control
    print('vector from PID machine')
    print(directionANDangle)

    commands = np.matrix([directionANDangle])

    rotate = np.matrix([[np.cos(r[2]), np.sin(r[2]), 0.0],
                        [-np.sin(r[2]), np.cos(r[2]), 0.0],
                        [0.0, 0.0, 1.0]])

    # individual motor commands we may need a control gain
    OMEGA = P.M3*rotate*commands
    print('OMEGA')
    print(OMEGA)
    # use the trims to correct the motor operation
    #OMEGA = np.dot(OMEGA,trims)

    intmega = np.matrix([[0], [0], [0]])
    intmega[0] = int(round(OMEGA[0] * 1000))
    intmega[1] = int(round(OMEGA[1] * 1000))
    intmega[2] = int(round(OMEGA[2] * 1000))
    print('intmega')
    print(intmega)

    DutyM1M2(128, intmega[0], intmega[1])
    DutyM1M2(129, intmega[2], 0)


def stop():
    DutyM1M2(128, 0, 0)
    DutyM1M2(129, 0, 0)

