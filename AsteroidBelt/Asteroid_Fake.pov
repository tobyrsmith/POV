#include "colors.inc"

#declare Here = 5 * <0,1000,0>;	    //Top


background { color Black }

camera {
  location Here
//  rotate <-25,0,0>
//  rotate <0,-37,0>
//  rotate <0,0,0>
  look_at  <0,0,0>
  angle 16
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

#declare rodP = 1.5;
#declare rod = 3;
#declare rodC = 3;


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
#include "PlanetOrb_Fake.dat"
//#include "meteorites.dat"
#include "astpos.dat"

// 2.8 AU
//torus {2.8 * au, 1.5
//  pigment { color rgbt <1,1,1, 0.85> }
//  no_shadow
//}


#declare Aj = 5.20336301;
#declare Pj = pow(Aj,(3.0/2.0));

#for (N, 1, 4, 1)

  #declare ResPeriod = Pj / N;
  #declare ResA = pow(ResPeriod,(2.0/3.0));

  torus {ResA * au, 1.5
    pigment { color rgbt <1,1,1,0.90> }
    no_shadow
  }

#end

// -------- Axis ----------

#declare Stick = 4000;
#declare Axis = union {

  cylinder {
        <0, 0, 0>, <Stick, 0, 0>, 5
        pigment { color rgb <1, 0, 0> }
  }

//  cylinder {
//        <-Stick, 0, 0>, <0, 0, 0>, 3
//        pigment { color rgb <1, 0, 0> }
//  }

//  cylinder {
//        <0, 0, 0>, <0, Stick, 0>, 10
//        pigment { color rgb <0, 1, 0> }
//  }

//  cylinder {
//        <0, -Stick, 0>, <0, 0, 0>, 3
//        pigment { color rgb <0, 1, 0> }
//  }

  cylinder {
        <0, 0, 0>, <0, 0, Stick>, 5
        pigment { color rgb <0, 0, 1> }
  }

//  cylinder {
//        <0, 0, -Stick>, <0, 0, 0>, 3
//       pigment { color rgb <0, 0, 1> }
//  }

}
// object {Axis}

// ./FindrXYZD.py 55686 troj.csv > astpos.dat
// povray Asteroid_Fake.pov -D +V +Q9 +A -MV3.1 +W1024 +H768