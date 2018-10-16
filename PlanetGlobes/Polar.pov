#include "colors.inc"
#include "Map.inc"

#declare Here = -15000 * y;
#declare Offset = 75000;

background { color Black }

camera {
  location Here
  angle 11
  look_at  <0, 0,  0>
}


sphere {
  <0, 0, 0>, 1000
  texture {
    pigment { image_map
      { gif ImageMap 
	map_type 1 
	interpolate 2
      }
    }
  }
    rotate <clock*180,0,0>
}

light_source { 
  Here  
  color White
}

light_source { 
  Here + Offset * x
 color Gray75
}

light_source { 
  Here - Offset * x
 color Gray75
}

light_source { 
  Here + Offset * z
 color Gray75
}

light_source { 
  Here - Offset * z
 color Gray75
}

// x-povray +I Polar -D +V +KFI1 +KFF2 +Q3 +KI0 +KF1 - 2 big images