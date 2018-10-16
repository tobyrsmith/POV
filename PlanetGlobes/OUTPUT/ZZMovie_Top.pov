// Looking down +x axis, +z right, +y up

#include "colors.inc"

#declare Here = 50000 * y;
#declare Offset = 100000;

background { color Black }

camera {
  location Here
  angle 3.1
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
#include "clockfile.dat"
#  rotate <0,0,0>

}


#declare LightColor = White;
#declare LightOff = Here - 10000 *y;

light_source { 
  LightOff + Offset * z
 color LightColor
}

light_source { 
  LightOff - Offset * z
 color LightColor
}

light_source { 
  LightOff + Offset *x 
 color LightColor
}

light_source { 
  LightOff - Offset *x 
 color LightColor
}

// povray ZZMovie.pov -D +V +Q0 -A -MV3.1 +KFI1 +KFF4 +KI0 +KF3
// povray ZZMovie.pov -D +V +Q9 +A -MV3.1 +KFI1 +KFF36 +KI0 +KF35 +W800 +H600

// povray ZZMovie.pov -D +V +Q9 +A -MV3.1 +KFI1 +KFF16 +KI0 +KF15 +W640 +H480


// x-povray +I ZZMovie +H120 +W160 -D +V +KFI1 +KFF10 +Q3 +KI1 +KF10
// convert -delay 30 -loop 1000 ZZMovie*.png XXMovieX.gif
