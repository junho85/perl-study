#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';

my $log = "name=june; msg=hello; etc=anything;";

my @split_arr = split /;/, $log;

for my $elem (@split_arr) {

    print $elem."\n";
}