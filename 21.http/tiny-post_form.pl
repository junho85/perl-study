#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Data::Dumper;

use HTTP::Tiny;

my $http = HTTP::Tiny->new();

my %headers = ();

my %data = (
    name    => "junho85",
    address => "korea"
);

my $url = "http://httpbin.org/post";
my $response = $http->post_form($url, \%data, {
    headers => \%headers,
    content => "test content"
});

print $response->{content};
