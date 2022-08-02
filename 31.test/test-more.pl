#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Test::More tests => 6;

my $got = "apple";
my $expected = "apple";

is($got, $expected, "test name");

$got = 1;
$expected = 1;
is_deeply($got, $expected, "test name");

ok("hello" eq "hello", "simple test");
ok("hello" eq "hello", "simple test");

my $path = path('.');
my $hash = {};
is_deeply( $path, "$path" ); # ok
is_deeply( $hash, "$hash" ); # fail

done_testing();

