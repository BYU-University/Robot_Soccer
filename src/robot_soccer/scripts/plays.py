import velchangers as vel
from run import *
from controller import *

# This is where we store our different plays


def goToBall(r, b):
    g = P.goal
    vx = P.k_vx*(r[0]-b[0])
    vy = P.k_vy*(r[1]-b[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


def goToGoal(r):
    g = P.goal
    vx = P.k_vx*(r[0]-g[0])
    vy = P.k_vy*(r[1]-g[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


def goToStartForward(r):
    pos = P.startForward
    g = P.goal
    vx = P.k_vx*(r[0]-pos[0])
    vy = P.k_vy*(r[1]-pos[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


def goToStartDefender(r):
    pos = P.startDefender
    g = P.goal
    vx = P.k_vx*(r[0]-pos[0])
    vy = P.k_vy*(r[1]-pos[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


def goToPoint(r, pos):
    g = P.goal
    vx = P.k_vx*(r[0]-pos[0])
    vy = P.k_vy*(r[1]-pos[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


