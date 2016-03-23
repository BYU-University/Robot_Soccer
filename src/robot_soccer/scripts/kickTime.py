from kick import *
from controller import *

# This the kick controller
# it uses a timer to keep from wildly kicking all the time the ball is close.
# the parameters for this and the counter are in 'storage.py' under the kTimer class


def kickTime(toGoal, dToBall):
    if K.count == 0 and K.kR > K.fPs and math.fabs(toGoal) < K.aA and dToBall < K.kR:
        kick()
        K.count += 1
    elif K.count == K.cL or dToBall > K.bZ+K.kR:
        K.count = 0
    else:
        K.count += 1

