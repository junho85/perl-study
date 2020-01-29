#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Net::DNS;

use Data::Dumper;

my $res = Net::DNS::Resolver->new;

my $domain = "gmail.com";

# mx 메서드 이용 방법
my @mxs = mx($res, $domain);
# print Dumper(\@mx);

for my $mx (@mxs) {
    print $mx->preference, ' ', $mx->exchange, "\n";
}

# query 메서드 이용 방법
my $reply = $res->query($domain, 'MX');

for my $mx ($reply->answer) {
    print $mx->preference, ' ', $mx->exchange, "\n";
}