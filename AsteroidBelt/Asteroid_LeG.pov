#include "colors.inc"

#declare Here = 5 * <0,1000,0>;	    //Top


background { color Black }

camera {
  location Here
  rotate <-45,0,0>
  rotate <0,-107,0>
  rotate <0,0,0>
  look_at  <0,0,0>
  angle 15 
}


#declare Fin1 = finish {
   roughness .8
};

#declare Fin2 = finish {
   diffuse 0.3
   ambient 0.3
};

light_source
{ <0,0,0>, 1
  looks_like
  { sphere
    { <0,0,0>,15
      pigment { Yellow }
      finish { Fin1 }
    }
  }
  translate <0,0,0>
}

//light_source { 
//  Here
//  color White
//}

#declare au = 100;

#declare rodP = 3;
#declare rod = 3;

//#declare asize = 2;


#declare acolor = < 0,0.75,1 >;

#declare psize = 10;
#declare pcolor = < 0,0,1 >;

#declare bcolor = < 1,0.45,0 >;

light_source { 
  <0,100 * au,0>  
  color White
}

light_source { 
  <0,10 * au,0>  
  color White
}

#include "asize.dat"
#include "PlanetOrb.dat"
#include "astpos.dat"

// 2.8 AU
torus {2.8 * au, 1.5
  pigment { color rgbt <1,1,1, 0.85> }
  no_shadow
}

// LaGrange Points

#declare Stick = 5.08 *au;
#declare Axis = union {


  cylinder {
    <1, 0, 0>, <Stick, 0, 0>, 3
    pigment { color rgb <1, 0.5, 0> }
    no_shadow
  }

  cylinder {
    <1, 0, 0>, <Stick, 0, 0>, 3
    pigment { color rgb <1, 0.5, 0> }
    rotate <0,60,0>
    no_shadow
  }

  cylinder {
    <1, 0, 0>, <Stick, 0, 0>, 3
    pigment { color rgb <1, 0.5, 0> }
    rotate <0,-60,0>
    no_shadow
  }

  cylinder {
    <1, 0, 0>, <Stick, 0, 0>, 3
    pigment { color rgb <1, 0.5, 0> }
    rotate <0,120,0>
    translate <Stick,0,0>
    no_shadow
  }

  cylinder {
    <1, 0, 0>, <Stick, 0, 0>, 3
    pigment { color rgb <1, 0.5, 0> }
    rotate <0,-120,0>
    translate <Stick,0,0>
    no_shadow
  }

  sphere { 
    <0,0,0>,15
    pigment { color rgb <1, 0.5, 0> }
    translate <Stick,0,0>
    no_shadow
  }

  sphere { 
    <0,0,0>,5
    pigment { color rgb <1, 0.5, 0> }
    translate <Stick,0,0>
    rotate <0,60,0>
    no_shadow
  }
   sphere { 
    <0,0,0>,5
    pigment { color rgb <1, 0.5, 0> }
    translate <Stick,0,0>
    rotate <0,-60,0>
    no_shadow
  }
 
}

object {
  Axis
  rotate <0,-17,0>
}

// ./FindrXYZD.py 55686 troj.csv > astpos.dat
// povray Asteroid.pov -D +V +Q9 +A -MV3.1 +W1024 +H768
