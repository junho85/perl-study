#!/usr/bin/perl

use strict;
use warnings;

use FindBin;

use Data::Dumper;

my @left_lines = `cat $FindBin::Bin/left.txt`;
my @right_lines = `cat $FindBin::Bin/right.txt`;

my %results = ();

for my $line (@left_lines) {
    chomp $line;
    $results{$line}++;
}

for my $line (@right_lines) {
    chomp $line;
    delete $results{$line};
}

my $count = 0;
for my $data (keys %results) {
    $count++;
}
print $count."\n";
