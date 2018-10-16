#include "colors.inc"

#declare Here = <20000,0,15000>;
#declare Light = 15000 * x;
#declare Offset = 75000;

background { color Black }

camera {
  location Here
  translate <clock*-10000,0,0>
  angle 11
  look_at  <0, 0,  0>
}

sphere {
  <0, 0, 0>, 1000
  texture {
    pigment { image_map
      { gif "Earth.gif" 
	map_type 1 
	interpolate 2
      }
    }
  }
}

light_source { 
  Light
  color White
}

light_source { 
  <5000,0,0>
  color White
}

// x-povray +I movie -D +V +KFI1 +KFF4 +Q3 +KI0 +KF4
