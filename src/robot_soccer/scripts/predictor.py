from classes import *
import math as m


def predict(ball_now):   # This should predict ball position to correct camera latency
    px = (G.ballPast[0]-ball_now[0])+ball_now
    if m.fabs(px) > 1.65:
        px = (G.ballPast[0]-ball_now[0])-ball_now

    py = (G.ballPast[1]-ball_now[1])+ball_now
    if m.fabs(px) > 0.825:
        px = (G.ballPast[1]-ball_now[1])-ball_now

    return [px, py]