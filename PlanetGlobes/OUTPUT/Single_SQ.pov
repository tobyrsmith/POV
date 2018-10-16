// Looking down +x axis, +z right, +y up

#include "colors.inc"

#declare Here = 50000 * x;
#declare Offset = 100000;

#background { color Black }
background { color White }

camera {
  right x*1000/1000
  location Here
  angle 2.32
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
  rotate <25,-145,0>

}


#declare LightColor = White;
#declare LightOff = Here;

light_source { 
  Here 
 color LightColor
}

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


// povray Single_SQ.pov -D +V +Q9 +A -MV3.1 +W550 +H550