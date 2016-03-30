
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
        self.kp = 5.0       # Proportional gain
        self.ki = 0.7      # Integral gain
        self.kd = 3.3       # Derivative gain
        self.kp_t = 0.0001     # Proportional gain
        self.ki_t = 0.000008    # Integral gain
        self.kd_t = 0.00001     # Derivative gain
        self.Ts = 0.1
        self.tau = 0.05     # dirty derivative
        self.limit = 30000
        # self.t     = 0