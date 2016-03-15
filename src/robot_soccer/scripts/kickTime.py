from kick import *

count = 0
bZ = 10 #buffer zone
kR = .09 #kick range
aA = .05 #angular accuracy
fP-S = 20 #fieldx-position to shoot from
cL = 1000 #count limit to reset

def kickTime():
	if count == 0 and xr > fP-s and math.abs(toGoal) < aA and xball < kR:
	    kick()
	    count += 1
	else if count == 1000 or xball > bZ+kR:
	    count = 0
	else:
	    count += 1
