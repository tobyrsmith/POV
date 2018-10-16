#include "colors.inc"
#include "Map.inc"

#declare Here = -15000 * z;
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
      { gif "Moon2.gif"
	map_type 1 
	interpolate 2
      }
    }
  }
    rotate <0,-90,0>
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
  Here + Offset * y
 color Gray75
}

light_source { 
  Here - Offset * y
 color Gray75
}

// x-povray +I Map -D +V +KFI1 +KFF4 +Q3 +KI0 +KF3 - 4 big images