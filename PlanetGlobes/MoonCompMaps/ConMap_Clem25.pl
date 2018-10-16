#!/usr/bin/perl

# Convert LP, Clem Data

my $datafile = $ARGV[0];

open(DATA, "< $datafile") || die $!;

my $i = 1;
my $j = 0;
my $k = 0;

while (<DATA>) {

    my $flag = $i%144;
    
    $lat = -89.875 + $j;
    $minLat = $lat - 0.125;
    $maxLat = $lat + 0.125;

    chop;
    next if (/^\#/);
    
    @data = split;

    foreach $item (@data) {
        $lon = $k + 0.125;
        $lon = $lon - 360.0 if ($lon > 180.0); 
	$minLon = $lon - 0.125;
	$maxLon = $lon + 0.125;
        print "$minLat, $maxLat, $minLon, $maxLon, $item\n";
	$k += 0.25;
    }

#    print "$i $flag $j $lat\n";

    $i++;
    $j += 0.25 if (!$flag);
    $k = 0 if (!$flag);
}

exit;
