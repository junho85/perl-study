#!/usr/bin/env perl

use strict;
use warnings;

use Net::DNS;
use Socket;

my $dns = Net::DNS::Resolver->new;

my $domain = "daum.net";
my $mx = $dns->query($domain, 'MX');

print "* $domain\n";
foreach my $rr ($mx->answer) {
    my $ip_addr = gethostbyname($rr->exchange);

    print $rr->preference, "\t";
    print $rr->exchange, "\t";
    print inet_ntoa($ip_addr), "\n";
}

