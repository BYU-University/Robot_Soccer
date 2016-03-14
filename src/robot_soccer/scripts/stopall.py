import roboclaw as r
r.Open('/dev/ttySAC0', 38400)


r.ForwardM1(128,0)
r.ForwardM2(128,0)
r.ForwardM1(129,0)
#r.SpeedM1M2(128,0,0)
#r.SpeedM1(129,0)



