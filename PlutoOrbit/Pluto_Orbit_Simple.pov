#include "colors.inc"
#include "metals.inc"

#declare au = 100;
#declare Pcolor = <0.25,0.25,0.25>;

#declare Here =  au * <0,-250,0>;

background { color White }

camera {
  location Here
  look_at  <0, 0, 0>
  rotate <0,90,0>
  angle 24
}

light_source { 
  <0,0,100000>  
  color White
}

light_source { 
  <100000,0,0>  
  color White
}
light_source { 
  <0,100000,0>  
  color White
}

light_source { 
  Here  
  color White
}

#declare rod = 40;
#declare rodC = 15;

// The Sun

#declare Fin2 = finish {
  roughness .9
}

sphere {
  <0,0,0> 10
  translate <0,0,0>
  pigment {Yellow}
  finish {Fin2}
}

//#include "KBO_Orbit.dat"
//#include "junk.dat"


// Mercury
torus {0.38709893*au,rodC
  scale <1,1,0.9786>
  translate <-0.0796*au,0,0>
  rotate <0,-77.45645,0>
  rotate <-7.00487,0,0>
  rotate <0,77.45645,0>
  rotate <0,-48.33167,0>
  pigment { color rgb Pcolor }
  no_shadow
}

// Venus
torus {0.72333199*au,rodC
  scale <1,1,1.0000>
  translate <-0.0049*au,0,0>
  rotate <0,-131.53298,0>
  rotate <-3.39471,0,0>
  rotate <0,131.53298,0>
  rotate <0,-76.68069,0>
  pigment { color rgb Pcolor }
  no_shadow
}

// Earth
torus {1.00000011*au,rodC
  scale <1,1,0.9999>
  translate <-0.0167*au,0,0>
  rotate <0,-102.94719,0>
  rotate <-0.00005,0,0>
  rotate <0,102.94719,0>
  rotate <0,--11.26064,0>
  pigment { color rgb Pcolor }
  no_shadow
}

// Mars
torus {1.52366231*au,rodC
  scale <1,1,0.9956>
  translate <-0.1423*au,0,0>
  rotate <0,-336.04084,0>
  rotate <-1.85061,0,0>
  rotate <0,336.04084,0>
  rotate <0,-49.57854,0>
  pigment { color rgb Pcolor }
  no_shadow
}

// Jupiter
torus {5.20336301*au,rod
  scale <1,1,0.9988>
  translate <-0.2518*au,0,0>
  rotate <0,-14.75385,0>
  rotate <-1.30530,0,0>
  rotate <0,14.75385,0>
  rotate <0,-100.55615,0>
  pigment { color rgb Pcolor }
  no_shadow
}

// Saturn
torus {9.53707032*au,rod
  scale <1,1,0.9985>
  translate <-0.5164*au,0,0>
  rotate <0,-92.43194,0>
  rotate <-2.48446,0,0>
  rotate <0,92.43194,0>
  rotate <0,-113.71504,0>
  pigment { color rgb Pcolor }
  no_shadow
}

// Uranus
torus {19.19126393*au,rod
  scale <1,1,0.9989>
  translate <-0.9052*au,0,0>
  rotate <0,-170.96424,0>
  rotate <-0.76986,0,0>
  rotate <0,170.96424,0>
  rotate <0,-74.22988,0>
  pigment { color rgb Pcolor }
  no_shadow
}

// Neptune
torus {30.06896348*au,rod
  scale <1,1,1.0000>
  translate <-0.2582*au,0,0>
  rotate <0,-44.97135,0>
  rotate <-1.76917,0,0>
  rotate <0,44.97135,0>
  rotate <0,-131.72169,0>
  pigment { color rgb Pcolor }
  no_shadow
}

// Pluto
torus {39.48168677*au,rod
  scale <1,1,0.9686>
  translate <-9.8233*au,0,0>
  rotate <0,-224.06676,0>
  rotate <-17.14175,0,0>
  rotate <0,224.06676,0>
  rotate <0,-110.30347,0>
  pigment { color rgb Pcolor }
  no_shadow
}


// -------- Axis ----------

#declare Stick = 300
#declare Axis = union {

  cylinder {
        <-Stick, 0, 0>, <Stick, 0, 0>, 3
        pigment { color rgb <1, 0, 0> }
  }

  cylinder {
        <0, -Stick, 0>, <0, Stick, 0>, 3
        pigment { color rgb <0, 1, 0> }
  }

  cylinder {
        <0, 0, -Stick>, <0, 0, Stick>, 3
        pigment { color rgb <0, 0, 1> }
  }

}
// object {Axis}

//povray +I junk -D +V +Q0 -A
//povray Pluto_Orbit.pov -D +V +Q0 -A -MV3.1 +H768 +W1024
