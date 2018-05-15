#!/usr/bin/python

import sys, math
from math import *

try:
    date = int(sys.argv[1])
    infilename = sys.argv[2]
except:
    print "Usage: ",sys.argv[0], " MJD  Datafile"; sys.exit(1)

ifile = open(infilename, 'r')    #open a file to read


# -----  Function to find Eccentric Anomaly ----
# -----  Do Not Change This! -------------------

def FindE (e,M):
    
    M = radians(M)
    E = [M]

    DeltaE = 100.0

    while (DeltaE > 1e-8):
        
        E.append(M + e * sin(E[-1]))
        DeltaE = abs(E[-1] - E[-2])

    return degrees(E[-1])

# -----  OK to change stuff below here  ---------

def FindM (a,date,Epoch,M):
    
    n = 1.7202e-2 * a**(-1.5) * (180.0 / pi)
    Mt = M + n * float(date - Epoch)
    return fmod(Mt,360.0)

def FindT (e,E):

    E = radians(E)

    T1 = sqrt((1.0 + e) / (1.0 - e)) * tan(E/2.0)
    T2 = 2.0 * atan(T1)
    T = degrees(T2)
    if (T < 0): T = T + 360.0
    return T

def Findr (a,e,E):
    
    E = radians(E)
    r = a * (1.0 - e * cos(E))
    return r

def FindXYZ(O,w,T,i):

    w = radians(w)
    O = radians(O)
    T = radians(T)
    i = radians(i)

    X1 = cos(O)*cos(w+T)
    X2 = sin(O)*sin(w+T)*cos(i)
    X = X1 - X2

    Y1 = sin(O)*cos(w+T)
    Y2 = cos(O)*sin(w+T)*cos(i)
    Y = Y1 + Y2

    Z = sin(w+T) * sin(i)

    return X,Y,Z

def FindV(r,a):

    mu = 2.9591e-4
    
    v1 = sqrt(mu * ((2.0/r) - (1.0/a)))
    v = v1 * 149598000/86400

    return v

for line in ifile:

    element = line.split(',')

    Epoch = int(element[1])
    a = float(element[2])
    e = float(element[3])
    i = float(element[4])
    om = float(element[5])
    w = float(element[6])
    M = float(element[7])
    name = element[0]

    Mt = FindM (a,date,Epoch,M)

    E = FindE(e,Mt)
    sE = "%.2f" % E

    T = FindT(e,E)
    sT = "%.2f" % T

    r = Findr(a,e,E)
    sr = "%.2f" % r

    v = FindV(r,a)
    sv = "%.2f" % v

    Coord = FindXYZ(om,w,T,i)

    X = r * Coord[0]
    Y = r * Coord[1]
    Z = r * Coord[2]

    sX = "%.3f" % X
    sY = "%.3f" % Y
    sZ = "%.3f" % Z

#    print name,date,"%.3f"%X ,"%.3f"%Y,"%.3f"%Z

    print """
    sphere { // """ + name + """
      <0,0,0> astsize
      translate < """ + sX + """ * au, """ + sZ + """ * au , """ + sY + """* au>
      pigment {color rgb acolor}
      finish {Fin2}
     }"""

ifile.close()

