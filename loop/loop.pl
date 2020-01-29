#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

for my $i (1..5) {
    print $i;
}

for (my $i=0; $i<5; $i++) {
    print $i."\n";
}

print "\n";
for my $i (0..5) {
    print $i."\n";
}

print "\n";
for my $i (0,1,2,3,4,5) {
    print $i."\n";
}

print "\n";
for my $i ('00'..'05') {
    print $i."\n";
}