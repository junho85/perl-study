#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

my $array_of_array_ref = [[1,2,3],[4,5,6]];
print(Dumper($array_of_array_ref)); # [[1,2,3],[4,5,6]]

my @result = map {@$_} @$array_of_array_ref;
print(Dumper(\@result)); # [1,2,3,4,5,6]