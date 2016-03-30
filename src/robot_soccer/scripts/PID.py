from classes import *
# These are the PID functions for use in the control of the robot


def PID(r, x_d, y_d, w_d):
    vx = PIDx(x_d, r[0])
    vy = PIDy(y_d, r[1])
    vw = PIDw(w_d, r[2])
    return [vx, vy, vw]

# PID control for x ----------------------------------------------------------------------------------------------------
def PIDx(x_d,x):
    # compute the error
    var.x_error = x_d-x
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
    if abs(var.xdot)< 1:
        var.x_integrator = var.x_integrator + vals.Ts/vals.ki*(u-u_unsat)

    return u

# PID control for y ----------------------------------------------------------------------------------------------------
def PIDy(y_d,y):
    # compute the error
    var.y_error = y_d-y
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
    if abs(var.ydot)< 1:
        var.y_integrator = var.y_integrator + vals.Ts/vals.ki*(u-u_unsat)

    return u

# PID control for w ----------------------------------------------------------------------------------------------------
def PIDw(w_d,w):
    # compute the error
    var.w_error = w_d-w
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
    if abs(var.ydot)< 1:
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


