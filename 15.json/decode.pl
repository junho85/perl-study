#!/usr/bin/env perl

use strict;
use warnings;

use JSON;
use Data::Dumper;

my $json_content = qq/{"hello":"world","parent":{"son":"grand son 손자"}}/;

my $data = decode_json($json_content);

print Dumper($data);