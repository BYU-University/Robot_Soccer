from kick import *

count = 0
bZ = 10      # buffer zone
kR = .09     # kick range
aA = .05     # angular accuracy
fPS = 20     # field x-position to shoot from
cL = 1000    # count limit to reset

def kickTime(xr, toGoal, xball):
	if kickTime.count == 0 and xr > fPs and math.abs(toGoal) < aA and xball < kR:
	    kick()
	    kickTime.count += 1
	elif kickTime.count == 1000 or xball > bZ+kR:
	    kickTime.count = 0
	else:
	    kickTime.count += 1

