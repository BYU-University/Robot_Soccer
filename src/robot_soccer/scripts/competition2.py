#!/usr/bin/env python
from roboclaw import *
import velchangers as v
import calibratepid as c
import math
import mat
from param import *
from Tkinter import *
import readchar
import kick 
#print("Reading a char:")
#print(repr(readchar.readchar()))
#print("Reading a key:")
#print(repr(readchar.readkey()))



class Field:
   def key(self):
       while True:
	#event = 'a'
	keyPressed = raw_input("Enter value")
	
       # keyPressed = repr(readchar.readchar())
        if keyPressed.strip() == 'i':
	  v.testrun(-12,-0.1,0)
          #kick.kick()
        elif keyPressed.strip() == 'o': # Stop
          #self.sendCommandCenter(1)
          v.testrun(-0.3,-12,0)
        elif keyPressed.strip() == 'p': # Go To Center
          #self.sendCommandCenter(3)
          v.testrun(12,0,0)
        elif keyPressed.strip() == 'l': # Go to starting position
          #self.sendCommandCenter(4)
          v.testrun(0.3,12,0)
        elif keyPressed.strip() == 'q':
	  kick.kick()
        elif keyPressed.strip() == 'm': # Run the "Test" strategy
          #self.sendCommandCenter(5)
	  v.stop()
          False
        #print "pressed", keyPressed#repr(readchar.readchar())
	
   #def initUI(self):  
    #    self.parent.bind("<Key>", self.key)

   #def __init__(self, parent):
   #     self.parent = parent
   #     self.initUI()



def main():
  try:
    Open('/dev/ttySAC0', 38400)
    c.go()
  except:
    global _SERIAL_ERR
    _SERIAL_ERR = True
  f = Field()
  f.key()



if __name__ == '__main__':
    main()
