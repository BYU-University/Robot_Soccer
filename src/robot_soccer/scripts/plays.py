import velchangers as vel
import math as m
from run import *

k_vx = 5  # gain for proportional control of x-position
k_vy = 5  # gain for proportional control of y-position
k_phi = 2  # gain for proportional angle control

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
    p = P.startForward
    g = P.goal
    vx = P.k_vx*(r[0]-p[0])
    vy = P.k_vy*(r[1]-p[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


def goToStartDefender(r):
    p = P.startDefender
    g = P.goal
    vx = P.k_vx*(r[0]-p[0])
    vy = P.k_vy*(r[1]-p[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


def goToPoint(r, p):
    g = P.goal
    vx = P.k_vx*(r[0]-p[0])
    vy = P.k_vy*(r[1]-p[1])
    theta_d = m.atan2(g[1]-r[1], g[0]-r[1])
    omega = P.k_phi*(r[2] - theta_d)
    vel.goXYOmegaTheta(vx, vy, omega)


