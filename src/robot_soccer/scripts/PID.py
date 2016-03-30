from altDrive import *
# These are the PID functions for use in the control of the robot
#
def PID(r, x_d, y_d, w_d):
    vx = PIDx(x_d,r[0])
    vy = PIDy(y_d,r[1])
    vw = PIDw(w_d,r[2])
    return [vx, vy, vw]

# PID control for x ----------------------------------------------------------------------------------------------------
def PIDx(x_d,x):
    # compute the error
    vars.x_error = vars.x_d-x
    # update integral of error
    vars.x_integrator = vars.x_integrator + (vals.Ts/2)*(vars.x_error+vars.x_error_d1)
    # update derivative of x
    vars.xdot = (2*vals.tau-vals.Ts)/(2*vals.tau+vals.Ts)*vars.xdot + 2/(2*vals.tau+vals.Ts)*(x-vars.x_d1)
    # update delayed variables for next time through the loop
    vars.x_error_d1 = vars.x_error
    vars.x_d1 = x

    # compute the pid control signal
    u_unsat = vals.kp*vars.x_error + vals.ki*vars.x_integrator - vals.kd*vars.xdot
    u = sat(u_unsat)

    # integrator anti-windup
    #if ki~=0,signal
    if abs(vars.xdot)< 0.1:
        vars.x_integrator = vars.x_integrator + vals.Ts/vals.ki*(u-u_unsat)

    return u

# PID control for y ----------------------------------------------------------------------------------------------------
def PIDy(y_d,y):
    # compute the error
    vars.y_error = vars.y_d-y
    # update integral of error
    vars.y_integrator = vars.y_integrator + (vals.Ts/2)*(vars.y_error+vars.y_error_d1)
    # update derivative of y
    vars.ydot = (2*vals.tau-vals.Ts)/(2*vals.tau+vals.Ts)*vars.ydot + 2/(2*vals.tau+vals.Ts)*(y-vars.y_d1)
    # update delayed variables for next time through the loop
    vars.y_error_d1 = vars.y_error
    vars.y_d1 = y

    # compute the pid control signal
    u_unsat = vals.kp*vars.y_error + vals.ki*vars.y_integrator - vals.kd*vars.ydot
    u = sat(u_unsat)

    # integrator anti-windup
    #if ki~=0,signal
    if abs(vars.ydot)< 0.1:
        vars.y_integrator = vars.y_integrator + vals.Ts/vals.ki*(u-u_unsat)

    return u

# PID control for w ----------------------------------------------------------------------------------------------------
def PIDw(w_d,w):
    # compute the error
    vars.w_error = vars.w_d-w
    # update integral of error
    vars.w_integrator = vars.w_integrator + (vals.Ts/2)*(vars.w_error+vars.w_error_d1)
    # update derivative of w
    vars.wdot = (2*vals.tau-vals.Ts)/(2*vals.tau+vals.Ts)*vars.wdot + 2/(2*vals.tau+vals.Ts)*(w-vars.w_d1)
    # update delayed variables for next time through the loop
    vars.w_error_d1 = vars.w_error
    vars.w_d1 = w

    # compute the pid control signal
    u_unsat = vals.kp_t*vars.w_error + vals.ki_t*vars.w_integrator - vals.kd_t*vars.wdot
    u = sat(u_unsat)

    # integrator anti-windup
    #if ki~=0,signal
    if abs(vars.ydot)< 0.1:
        vars.w_integrator = vars.w_integrator + vals.Ts/vals.ki_t*(u-u_unsat)

    return u


class pVars:
    def __init__(self):
        # x variables
        self.x_integrator = 0.0
        self.xdot = 0.0
        self.x_error_d1 = 0.0
        self.x_d1 = 0.0
        # y variables
        self.y_integrator = 0.0
        self.ydot = 0.0
        self.y_error_d1 = 0.0
        self.y_d1 = 0.0
        # w variables
        self.w_integrator = 0.0
        self.wdot = 0.0
        self.w_error_d1 = 0.0
        self.w_d1 = 0.0


class pidVals:
    def __init__(self):
        self.kp = 1.0       # Proportional gain
        self.ki = 0.01      # Integral gain
        self.kd = 0.7       # Derivative gain
        self.kp_t = 0.5     # Proportional gain
        self.ki_t = 0.01    # Integral gain
        self.kd_t = 0.4     # Derivative gain
        self.Ts = 0.1
        self.tau = 0.05     # dirty derivative
        self.limit = 30000
        # self.t     = 0

#-----------------------------------------------------------------
# saturation function
def sat(input):
    if input > vals.limit:
        return vals.limit
    elif input < -vals.limit:
        return -vals.limit
    else:
        return input


