#include "colors.inc"
#include "Map.inc"

#declare Here = 15000 * x;
#declare Offset = 75000;

background { color Black }

camera {
  location Here
  angle 11
  look_at  <0, 0, 0>
}

sphere {
  <0, 0, 0>, 1000
  texture {
    pigment { image_map
      { png "ImageMap.png" 
	map_type 1 
	interpolate 2
      }
    }
  }
  rotate <0,clock*10,0>
}

light_source { 
  Here
  color Gray40
    spotlight
    radius 10
    point_at <0,0,0>
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

// povray Movie.pov -D +V +Q0 -A -MV3.1 +KFI1 +KFF4 +KI0 +KF3
// povray Movie.pov -D +V +Q9 +A -MV3.1 +KFI1 +KFF36 +KI0 +KF35 +W800 +H600

// povray Movie.pov -D +V +Q9 +A -MV3.1 +KFI1 +KFF16 +KI0 +KF15 +W640 +H480


// x-povray +I Movie +H120 +W160 -D +V +KFI1 +KFF10 +Q3 +KI1 +KF10
// convert -delay 30 -loop 1000 Movie*.png XXMovieX.gif
