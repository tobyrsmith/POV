#!/usr/bin/perl

# Convert LP, Clem Data

my $datafile = $ARGV[0];

open(DATA, "< $datafile") || die $!;

my $i = 1;
my $j = 0;
my $k = 0;

while (<DATA>) {

    my $flag = $i%36;
    
    $lat = -89.5 + $j;
    $minLat = $lat - 0.5;
    $maxLat = $lat + 0.5;

    chop;
    next if (/^\#/);
    
    @data = split;

    foreach $item (@data) {
        $lon = $k + 0.5;
        $lon = $lon - 360.0 if ($lon > 180.0); 
	$minLon = $lon - 0.5;
	$maxLon = $lon + 0.5;
        print "$minLat, $maxLat, $minLon, $maxLon, $item\n";
	$k++;
    }

#    print "$i $flag $j $lat\n";

    $i++;
    $j++ if (!$flag);
    $k = 0 if (!$flag);
}

exit;
