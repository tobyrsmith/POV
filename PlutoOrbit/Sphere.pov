#include "colors.inc"
#include "metals.inc"

#declare Here = 1 * <0,0,500>

background { color Black }

camera {
  location Here
  look_at  <0, 0,  0>
}

//light_source { 
//  <0,0,100000>  
//  color White
//}

light_source { 
  <10000,0,5000>  
  color Red
}

//light_source { 
//  <0,100000,0>  
//  color White
//}

//light_source { 
//  Here  
//  color White
//}

#declare au = 100
#declare rod = 4
#declare astsize = 5
#declare acolor = <0,0.75,1>
// The Sun

#declare Fin2 = finish {
  roughness .1
}

sphere {
  <0,0,0> 100
  translate <0,0,0>
  pigment {White}
  finish {Fin2}
}


// povray 2001.pov -D +V +Q9 +A -MV3.1 +W1024 +H768
