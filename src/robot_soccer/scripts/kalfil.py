#utility - kalman filter for ball
import param as P
import numpy as np



class kal():
    def __init__(self):
        # parameters for ball Kalman filter
        self.camera_sample_rate = 30.0
        self.control_sample_rate = 30.0
        self.dirty_derivative_gain = self.camera_sample_rate/5
        self.camera_sample_rate = 10*self.control_sample_rate
        self.camera_sigma_ball = 0.005

        self.A_ball = np.matrix([[0, 0, 1, 0, 0, 0, 0, 0],
                                 [0, 0, 0, 1, 0, 0, 0, 0],
                                 [0, 0, 0, 0, 1, 0, 0, 0],
                                 [0, 0, 0, 0, 0, 1, 0, 0],
                                 [0, 0, 0, 0, 0, 0, 1, 0],
                                 [0, 0, 0, 0, 0, 0, 0, 1],
                                 [0, 0, 0, 0, 0, 0, 0, 0],
                                 [0, 0, 0, 0, 0, 0, 0, 0]])

        self.C_ball = np.matrix([[1, 0, 0, 0, 0, 0, 0, 0],
                                 [0, 1, 0, 0, 0, 0, 0, 0]])

        self.eye8 = np.matrix([[1, 0, 0, 0, 0, 0, 0, 0],
                               [0, 1, 0, 0, 0, 0, 0, 0],
                               [0, 0, 1, 0, 0, 0, 0, 0],
                               [0, 0, 0, 1, 0, 0, 0, 0],
                               [0, 0, 0, 0, 1, 0, 0, 0],
                               [0, 0, 0, 0, 0, 1, 0, 0],
                               [0, 0, 0, 0, 0, 0, 1, 0],
                               [0, 0, 0, 0, 0, 0, 0, 1]])

        self.xhat = np.matrix([[0],               # initial guess at x-position of ball
                               [0],               # initial guess at y-position of ball
                               [0],               # initial guess at x-velocity of ball
                               [0],               # initial guess at y-velocity of ball
                               [0],               # initial guess at x-acceleration of ball
                               [0],               # initial guess at y-acceleration of ball
                               [0],               # initial guess at x-jerk of ball
                               [0]])              # initial guess at y-jerk of ball

        self.xhat_delayed = self.xhat

        self.S = np.matrix([[P.field_width/2, 0, 0, 0, 0, 0, 0, 0], # initial variance of x-position of ball
                            [0, P.field_width/2, 0, 0, 0, 0, 0, 0], # initial variance of y-position of ball
                            [0, 0, .01, 0, 0, 0, 0, 0],             # initial variance of x-velocity of ball
                            [0, 0, 0, .01, 0, 0, 0, 0],             # initial variance of y-velocity of ball
                            [0, 0, 0, 0, .001, 0, 0, 0],            # initial variance of x-acceleration of ball
                            [0, 0, 0, 0, 0, .001, 0, 0],            # initial variance of y-acceleration of ball
                            [0, 0, 0, 0, 0, 0, .0001, 0],           # initial variance of x-jerk of ball
                            [0, 0, 0, 0, 0, 0, 0, .0001]])          # initial variance of y-jerk of ball

        self.S_delayed = self.S

# need help to understand these, are they used to make the noisy signal?

        self.Q_ball = np.matrix([[.001**2, 0, 0, 0, 0, 0, 0, 0],
                                   [0, .001**2, 0, 0, 0, 0, 0, 0],
                                   [0, 0, .01**2, 0, 0, 0, 0, 0],
                                   [0, 0, 0, .01**2, 0, 0, 0, 0],
                                   [0, 0, 0, 0, .1**2, 0, 0, 0],
                                   [0, 0, 0, 0, 0, .1**2, 0, 0],
                                   [0, 0, 0, 0, 0, 0, 10**2, 0],
                                   [0, 0, 0, 0, 0, 0, 0, 10**2]])

        self.R_ball = np.matrix([[self.camera_sigma_ball**2, 0], [0, self.camera_sigma_ball**2]])

    def kal_fil_x_y(self, ball, t, P):

        # prediction step between measurements
        N = 3
        for i in range(0, N):
            self.xhat = self.xhat + (self.control_sample_rate/N)*self.A_ball*self.xhat
            self.S = self.S + (self.control_sample_rate/N)*(self.A_ball*self.S+self.S*np.transpose(self.A_ball)+self.Q_ball)

        # correction step at measurement
        if ball.camera_flag: # only update when the camera flag is one indicating a new measurement
                y = ball.position_camera # actual measurement
                y_pred = self.C_ball*self.xhat_delayed  # predicted measurement
                L = self.S_delayed*np.transpose(self.C_ball)/(self.R_ball+self.C_ball*self.S_delayed*np.transpose(self.C_ball))
                self.S_delayed = (self.eye8-L*self.C_ball)*self.S_delayed
                self.xhat_delayed = self.xhat_delayed + L*(y-y_pred)

                for j in range(0, N*(self.camera_sample_rate/self.control_sample_rate)):
                    self.xhat_delayed = self.xhat_delayed + (self.control_sample_rate/N)*(self.A_ball*self.xhat_delayed)
                    self.S_delayed = self.S_delayed + (self.control_sample_rate/N)*(self.A_ball*self.S_delayed+self.S_delayed*np.transpose(self.A_ball)+self.Q_ball)

                self.xhat = self.xhat_delayed
                self.S  = self.S_delayed

        # output current estimate of state
        ball.position[0] = self.xhat.item(0)
        ball.position[1] = self.xhat.item(1)
        ball.velocity[0] = self.xhat.item(2)
        ball.velocity[1] = self.xhat.item(3)
        ball.acceleration[0] = self.xhat.item(4)
        ball.acceleration[1] = self.xhat.item(5)
        ball.jerk[0] = self.xhat.item(6)
        ball.jerk[1] = self.xhat.item(7)
        ball.S = self.S

