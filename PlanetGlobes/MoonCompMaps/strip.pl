#!/usr/bin/perl

# Moon Data Mapper v 0.1

use GD;

my $im = new GD::Image(256,256);

foreach $i (0..255) {
    $color = $im->colorAllocate($i,$i,$i);
}


for ($x=0;$x<256;$x++) {
    for ($y=0;$y<256;$y++) {
	$index = $im->colorClosest($x,$x,$x);
	$im->setPixel($x,$y,$index);
    }
}

$index = $im->colorClosest(127,127,127);
$im->filledRectangle(0,0,100,100,$index);
$im->filledRectangle(50,50,150,150,$index);


for ($j=1;$j<11;$j++){

    $k = 255.0/$j;
    $l = 20.0 * $j;
    $index = $im->colorClosest($k,$k,$k);
    $im->filledRectangle($l,$l,255,255,$index);
}

binmode STDOUT;
print $im->png;

exit;
