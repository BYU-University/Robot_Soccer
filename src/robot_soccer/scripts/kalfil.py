#utility - kalman filter for ball
lpf_alpha = 0.7
dirty_derivative_gain = P.camera_sample_rate/5
camera_sample_rate = 10*control_sample_rate

def ball = utility_kalman_filter_ball(ball, t, P)


    persistent xhat
    persistent xhat_delayed
    persistent S
    persistent S_delayed


    if t == 0:  # initialize filter
        xhat = np.matrix([
            [0],               # initial guess at x-position of ball
            [0],               # initial guess at y-position of ball
            [0],               # initial guess at x-velocity of ball
            [0],               # initial guess at y-velocity of ball
            [0],               # initial guess at x-acceleration of ball
            [0],               # initial guess at y-acceleration of ball
            [0],               # initial guess at x-jerk of ball
            [0]                # initial guess at y-jerk of ball
            ])
        xhat_delayed = xhat
        S = np.diag([
            [P.field_width/2, 0, 0, 0, 0, 0, 0, 0], # initial variance of x-position of ball
            [0, P.field_width/2, 0, 0, 0, 0, 0, 0], # initial variance of y-position of ball
            [0, 0, .01, 0, 0, 0, 0, 0],             # initial variance of x-velocity of ball
            [0, 0, 0, .01, 0, 0, 0, 0],             # initial variance of y-velocity of ball
            [0, 0, 0, 0, .001, 0, 0, 0],            # initial variance of x-acceleration of ball
            [0, 0, 0, 0, 0, .001, 0, 0],            # initial variance of y-acceleration of ball
            [0, 0, 0, 0, 0, 0, .0001, 0],           # initial variance of x-jerk of ball
            [0, 0, 0, 0, 0, 0, 0, .0001]            # initial variance of y-jerk of ball
            ])
        S_delayed=S

    # prediction step between measurements
    N = 10
    for i=1:N:
        xhat = xhat + (P.control_sample_rate/N)*P.A_ball*xhat
        S = S + (P.control_sample_rate/N)*(P.A_ball*S+S*P.A_ball'+P.Q_ball)

    # correction step at measurement
    if ball.camera_flag, % only update when the camera flag is one indicating a new measurement
        # case 1 does not compensate for camera delay
        # case 2 compensates for fixed camera delay
        switch 2
            case 1:
                y = ball.position_camera; % actual measurement
                y_pred = P.C_ball*xhat;  % predicted measurement
                L = S*P.C_ball'/(P.R_ball+P.C_ball*S*P.C_ball')
                S = (eye(8)-L*P.C_ball)*S
                xhat = xhat + L*(y-y_pred)
            case 2,
                y = ball.position_camera; % actual measuremnt
                y_pred = P.C_ball*xhat_delayed;  % predicted measurement
                L = S_delayed*P.C_ball'/(P.R_ball+P.C_ball*S_delayed*P.C_ball');
                S_delayed = (eye(8)-L*P.C_ball)*S_delayed;
                xhat_delayed = xhat_delayed + L*(y-y_pred);
                for i=1:N*(P.camera_sample_rate/P.control_sample_rate),
                    xhat_delayed = xhat_delayed + (P.control_sample_rate/N)*(P.A_ball*xhat_delayed);
                    S_delayed = S_delayed + (P.control_sample_rate/N)*(P.A_ball*S_delayed+S_delayed*P.A_ball'+P.Q_ball);
                xhat = xhat_delayed;
                S    = S_delayed;

    % output current estimate of state
    ball.position     = xhat(1:2)
    ball.velocity     = xhat(3:4)
    ball.acceleration = xhat(5:6)
    ball.jerk         = xhat(7:8)
    ball.S            = S


#------------------------------------------
# utility - low pass filter ball position - differentiate for velocity
#
def ball = utility_lpf_ball(ball,t,P)
    persistent position
    persistent position_delayed
    persistent velocity
    persistent old_position_measurement
    persistent a1
    persistent a2

    if t==0:  # initialize filter
        position = matrix([[0], [0]])
        position_delayed = position
        velocity = matrix([[0], [0]])
        old_position_measurement = position
        # dirty derivative coefficients
        a1 = (2*P.dirty_derivative_gain-P.camera_sample_rate)/(2*P.dirty_derivative_gain+P.camera_sample_rate);
        a2 = 2/(2*P.dirty_derivative_gain+P.camera_sample_rate);

    switch 3,
        # case 1 does not compensate for camera delay
        # case 2 compensates for fixed camera delay
        # case 3 compensates for camera delay and wall bounces (doesn't account for robot bounces)
        case 1,
            if ball.camera_flag, # only update if there is a measurement
                # low pass filter position
                position = P.lpf_alpha*position + (1-P.lpf_alpha)*ball.position_camera
                # compute velocity by dirty derivative of position
                Ts = P.camera_sample_rate
                tau = P.dirty_derivative_gain
                velocity = a1*velocity + a2*(ball.position_camera-old_position_measurement)
                old_position_measurement = ball.position_camera
        case 2,
            if ball.camera_flag: # correction
                # low pass filter position
                position_delayed = P.lpf_alpha*position_delayed + (1-P.lpf_alpha)*ball.position_camera
                # compute velocity by dirty derivative of position
                velocity = a1*velocity + a2*(ball.position_camera-old_position_measurement)
                old_position_measurement = ball.position_camera
                # propagate upto current location
                for i=1:(camera_sample_rate/control_sample_rate):
                    position_delayed = position_delayed + control_sample_rate*velocity
                position = position_delayed
            else # prediction
                # propagate prediction ahead one control sample time
                position = position + control_sample_rate*velocity
        case 3,
            if ball.camera_flag: # correction
                # low pass filter position
                position_delayed = lpf_alpha*position_delayed + (1-lpf_alpha)*ball.position_camera
                # compute velocity by dirty derivative of position
                velocity = a1*velocity + a2*(ball.position_camera-old_position_measurement)
                velocity = utility_wall_bounce(position_delayed,velocity,P)
                old_position_measurement = ball.position_camera
                # propagate up to current location
                for i=1:(P.camera_sample_rate/P.control_sample_rate):
                    position_delayed = position_delayed + control_sample_rate*velocity
                    velocity = utility_wall_bounce(position_delayed,velocity,P)
                position = position_delayed
            else # prediction
                # propagate prediction ahead one control sample time
                position = position + control_sample_rate*velocity
                velocity = utility_wall_bounce(position,velocity,P) # <-- need to define P stuff

    # output current estimate of state
    ball.position     = position
    ball.velocity     = velocity
    ball.S            = .001*eye(2);  # this is for display only

#------------------------------------------
# utility - low pass filter ball position - differentiate for velocity
#
function velocity = utility_wall_bounce(position,velocity,P)
    # check for bounce off end walls
    if  abs(position(1)) >=  P.field_length/2:
        velocity(1)=-velocity(1)
    # check for bounce off side walls
    if  abs(position(2)) >=  P.field_width/2:
        velocity(2)=-velocity(2)