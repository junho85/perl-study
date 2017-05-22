#!/usr/bin/env perl

use strict;
use warnings;

use JSON;
use Data::Dumper;

my %hash = (
    hello => "world",
    parent => {
        son => "grand son"
    }
);

print encode_json(\%hash);
# {"hello":"world","parent":{"son":"grand son"}}
print "\n";

print JSON->new->encode(\%hash);
# {"hello":"world","parent":{"son":"grand son"}}
print "\n";

print JSON->new->pretty->encode(\%hash);
# {
#     "hello" : "world",
#     "parent" : {
#         "son" : "grand son"
#     }
# }

my $json_content = qq/{"hello":"world","parent":{"son":"grand son"}}/;

my $data = decode_json($json_content);

print Dumper($data);