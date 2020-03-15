#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

my %some_hash = (
    'june' => 12,
    'hello' => 22,
    'world' => 33
);

# keys
print "=== keys ===\n";
for my $key (keys %some_hash) {
    print "$key : $some_hash{$key}\n";
}

# each
print "=== each ===\n";
while (my ($key, $value) = each %some_hash) {
    print "$key : $value\n";
}
