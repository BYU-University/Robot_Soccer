from altDrive import *
# These are the PID functions for use in the control of the robot

class pVars():
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


class pidVals():
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



def PID(r, x_d, y_d, w_d):
    vx = PIDx(x_d,r[0])
    vy = PIDy(y_d,r[1])
    vw = PIDw(w_d,r[2])
    return [vx, vy, vw]

# PID control for x ----------------------------------------------------------------------------------------------------
def PIDx(x_d,x):
    # compute the error
    var.x_error = var.x_d-x
    # update integral of error
    var.x_integrator = var.x_integrator + (vals.Ts/2)*(var.x_error+var.x_error_d1)
    # update derivative of x
    var.xdot = (2*vals.tau-vals.Ts)/(2*vals.tau+vals.Ts)*var.xdot + 2/(2*vals.tau+vals.Ts)*(x-var.x_d1)
    # update delayed variables for next time through the loop
    var.x_error_d1 = var.x_error
    var.x_d1 = x

    # compute the pid control signal
    u_unsat = vals.kp*var.x_error + vals.ki*var.x_integrator - vals.kd*var.xdot
    u = sat(u_unsat)

    # integrator anti-windup
    #if ki~=0,signal
    if abs(var.xdot)< 0.1:
        var.x_integrator = var.x_integrator + vals.Ts/vals.ki*(u-u_unsat)

    return u

# PID control for y ----------------------------------------------------------------------------------------------------
def PIDy(y_d,y):
    # compute the error
    var.y_error = var.y_d-y
    # update integral of error
    var.y_integrator = var.y_integrator + (vals.Ts/2)*(var.y_error+var.y_error_d1)
    # update derivative of y
    var.ydot = (2*vals.tau-vals.Ts)/(2*vals.tau+vals.Ts)*var.ydot + 2/(2*vals.tau+vals.Ts)*(y-var.y_d1)
    # update delayed variables for next time through the loop
    var.y_error_d1 = var.y_error
    var.y_d1 = y

    # compute the pid control signal
    u_unsat = vals.kp*var.y_error + vals.ki*var.y_integrator - vals.kd*var.ydot
    u = sat(u_unsat)

    # integrator anti-windup
    #if ki~=0,signal
    if abs(var.ydot)< 0.1:
        var.y_integrator = var.y_integrator + vals.Ts/vals.ki*(u-u_unsat)

    return u

# PID control for w ----------------------------------------------------------------------------------------------------
def PIDw(w_d,w):
    # compute the error
    var.w_error = var.w_d-w
    # update integral of error
    var.w_integrator = var.w_integrator + (vals.Ts/2)*(var.w_error+var.w_error_d1)
    # update derivative of w
    var.wdot = (2*vals.tau-vals.Ts)/(2*vals.tau+vals.Ts)*var.wdot + 2/(2*vals.tau+vals.Ts)*(w-var.w_d1)
    # update delayed variables for next time through the loop
    var.w_error_d1 = var.w_error
    var.w_d1 = w

    # compute the pid control signal
    u_unsat = vals.kp_t*var.w_error + vals.ki_t*var.w_integrator - vals.kd_t*var.wdot
    u = sat(u_unsat)

    # integrator anti-windup
    #if ki~=0,signal
    if abs(var.ydot)< 0.1:
        var.w_integrator = var.w_integrator + vals.Ts/vals.ki_t*(u-u_unsat)

    return u



#-----------------------------------------------------------------
# saturation function
def sat(input):
    if input > vals.limit:
        return vals.limit
    elif input < -vals.limit:
        return -vals.limit
    else:
        return input


