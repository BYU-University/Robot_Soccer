from controller import *
import numpy as np

# This is an alternative way to drive the motors based on velocity and PWM for each motor
# PWM values range from -32767 to +32767 (eg. +-100% duty).


# need to find a max value of this math and then scale it to the PWM range as an int


def velDrive(x, y, a_d, r):

    commands = np.matrix([[x], [y], [a_d]])

    rotate = np.matrix([[np.cos(r[2]), np.sin(r[2]), 0.0],
                        [-np.sin(r[2]), np.cos(r[2]), 0.0],
                        [0.0, 0.0, 1.0]])

    # individual motor commands we may need a control gain
    OMEGA = P.M3*rotate*commands
    print('OMEGA 1')
    print(OMEGA)
    # use the trims to correct the motor operation
    #OMEGA = np.dot(OMEGA,trims)

    OMEGA = int(round(OMEGA * 1000))
    print('OMEGA 2')
    print(OMEGA)


    DutyM1(128, OMEGA[0])
    DutyM2(128, OMEGA[1])
    DutyM1(129, OMEGA[2])


def stop():
    DutyM1(128, 0)
    DutyM2(128, 0)
    DutyM1(129, 0)

