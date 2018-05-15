#!/usr/bin/python

# Import the lib that we need.
# math and sys are a good strting default

import sys, math
from math import *
from random import randint

# read in the commandline.  Look for at least one argument
# and complain if it is not found

try:
    infilename = sys.argv[1]
except:
    print "I'm sorry, Dave. I'm afraid I can't do that"; sys.exit(1)

ifile = open(infilename, 'r')    #open a file to read


def main():

    for line in ifile:

        element = line.split(',')      # Each line of the data file is split up
                                    # and assigned to a variable.
        Mass = float(element[0])
        a = float(element[1])
        e = float(element[2])
        i = 0.0
        om = randint(0,359)
        w = randint(0,359) 

        if (Mass < 8.0): continue

	color = "Magenta"

	scale = "%.4f" % sqrt (1.0 - e**2)
	tran = "%.4f" % (-1.0 * a * e)

        print "// " + str(Mass)
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

    ifile.close()          # close data file

if __name__ == "__main__": # Run the main program and exit
    main()
