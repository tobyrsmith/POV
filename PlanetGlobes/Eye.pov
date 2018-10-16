#include "colors.inc"
#include "Map.inc"

#declare Here = -15000 * z;
#declare Offset = 75000;

background { color White }

camera {
  location Here
  angle 11
  look_at  <0, 0,  0>
}


torus {1000,5
  scale <1,1,1>
  rotate <0,0,50>
  pigment { Black }
}

torus {1000,5
  scale <1,1,1>
  rotate <0,0,50>
  rotate <41,0,0>
  pigment { Black }
}


sphere {
  <0, 0, 0>, 1000
  texture {
    pigment { image_map
      { png "MapMap.png"
	map_type 1 
	interpolate 2
      }
    }
  }
    rotate <0,-24,0>
    rotate <0,0,0>
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

// povray NewMap.pov -D +V +Q0 -A -MV3.1 +KFI1 +KFF4 +KI0 +KF3

// povray Eye.pov -D +V +Q9 +A +W1024 +H768
// convert -delay 30 NewMap*.png junk.gif
