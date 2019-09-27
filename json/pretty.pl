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

print JSON->new->pretty->encode(\%hash);
# {
#     "hello" : "world",
#     "parent" : {
#         "son" : "grand son"
#     }
# }

