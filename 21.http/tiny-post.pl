#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Data::Dumper;

use HTTP::Tiny;
use JSON;

my $http = HTTP::Tiny->new();

my %headers = ();

my %data = (
    name    => "junho85",
    address => "korea"
);

my $url = "http://httpbin.org/post";
my $response = $http->post($url, {
    headers => \%headers,
    content => encode_json(\%data)
});

print $response->{content};
