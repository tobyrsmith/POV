#!/usr/bin/perl

# Moon Data Mapper v 0.1

use GD;

my $minV = -7978.6;
my $maxV = 8722.0;

my $m = 255.0 / ($maxV - $minV);
my $b = -1.0 * $m * $minV; 

my $width = 4096;           # Set this by hand (even number!)
my $height = $width / 2.0;

my $im = new GD::Image($width,$height);

foreach $i (0..255) {
    $color = $im->colorAllocate($i,$i,$i);
}

my $datafile = $ARGV[0];

open(DATA, "< $datafile") || die $!;

while (<DATA>) {

    chop;
    next if (/^\#/);
    
    @coord = split ",", $_ ;

    $minLat = $coord[0];
    $maxLat = $coord[1];
    $minLon = $coord[2];
    $maxLon = $coord[3];
    $ppm = $coord[4];

    $minX = getX($minLon);
    $maxX = getX($maxLon);
    $minY = getY($minLat);
    $maxY = getY($maxLat);

    $grey = int (($ppm * $m + $b) + 0.5);

    $index = $im->colorClosest($grey,$grey,$grey);
    $im->filledRectangle($minX,$maxY,$maxX,$minY,$index);

#    print "$minX $minY $maxX $maxY $grey\n";

}

close (DATA);
 
binmode STDOUT;
print $im->png;

exit;

sub getX {

    my $long = shift;
    my $X = ($width / 360.0) * $long + ($width / 2.0);
    return int($X + 0.5);
}

sub getY {

    my $lat = shift;
    my $Y = (-1.0 * $height / 180.0) * $lat + ($height / 2.0);
    return int($Y + 0.5);
}

