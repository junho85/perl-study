#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
binmode STDOUT, ":utf8";

use JSON;
use Data::Dumper;

my %hash = (
    hello => "world",
    parent => {
        son => "grand son 손자"
    }
);

## encode_json == JSON->new_utf8->encode
print encode_json(\%hash);
# {"hello":"world","parent":{"son":"grand son ì  ì  "}}
print "\n";

print JSON->new->utf8->encode(\%hash);
# {"hello":"world","parent":{"son":"grand son"}}
print "\n";



## to_json == JSON->new->encode
print to_json(\%hash);
# {"hello":"world","parent":{"son":"grand son"}}
print "\n";

print JSON->new->encode(\%hash);
# {"hello":"world","parent":{"son":"grand son"}}
print "\n";
