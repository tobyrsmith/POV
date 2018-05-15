#!/usr/bin/python

# Import the lib that we need.
# math and sys are a good strting default

import sys, math
from math import *

def main():

        a = 2.76370465915318
        e = .1743192347374478
        i = 5.869316403100039
        om = 144.6877106528048
        w = 215.7061672437268

	color = "Magenta"

	scale = "%.4f" % sqrt (1.0 - e**2)
	tran = "%.4f" % (-1.0 * a * e)

        print "// " 
	print "torus {" + str(a) + "*au" + ",rodP"
	print "  scale <1,1," + scale + ">"
	print "  translate<" + tran + "*au,0,0>"
	print "  rotate <0,-" + str(w) + ",0>"
	print "  rotate <-" + str(i) + ",0,0>"
	print "  rotate <0,-" + str(om) + ",0>"
	print "  pigment{ " + color + " }"
        print "  no_shadow"
	print "}"
	print ""

if __name__ == "__main__": # Run the main program and exit
    main()
