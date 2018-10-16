// Looking down +x axis, +z right, +y up

#include "colors.inc"

#declare Here = 50000 * x;
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

//#include "clockfile.dat"
//  rotate <0,0,90>
  rotate <0,0,-90>

}


#declare LightColor = White;
#declare LightOff = Here - 10000 *x;

light_source { 
  LightOff + Offset * z
 color LightColor
}

light_source { 
  LightOff - Offset * z
 color LightColor
}

light_source { 
  LightOff + Offset * y
 color LightColor
}

light_source { 
  LightOff - Offset * y
 color LightColor
}

// povray Single.pov -D +V +Q9 +A -MV3.1 +W800 +H600

// povray Single.pov -D +V +Q9 +A -MV3.1 +W4096 +H3072
