#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use POSIX 'strftime';

sub print_now {
    my $date = strftime '%Y/%m/%d %H:%M:%S', localtime;
    print $date."\n";
}

print_now();
sleep(1);
print_now();
sleep(1);
print_now();
sleep(1);
