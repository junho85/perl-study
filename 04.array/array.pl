#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Data::Dumper;

my @arr1 = (1,2,3,4,5);

print Dumper(\@arr1); # [1,2,3,4,5]

my @arr2 = [1,2,3,4,5];

print Dumper(\@arr2); # [[1,2,3,4,5]]

my $arr3 = [1,2,3,4,5];

print Dumper($arr3); # [1,2,3,4,5]

my $not_array = {};
my $array = [];

if (ref $not_array eq 'ARRAY') {
    print "array\n";
} else {
    print "not array\n";
}

if (UNIVERSAL::isa($not_array, 'ARRAY')) {
    print "array\n";
} else {
    print "not array\n";
}


if (ref $array eq 'ARRAY') {
    print "array\n";
} else {
    print "not array\n";
}

if (UNIVERSAL::isa($array, 'ARRAY')) {
    print "array\n";
} else {
    print "not array\n";
}
