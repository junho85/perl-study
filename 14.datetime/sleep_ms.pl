#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Time::HiRes;

use POSIX 'strftime';

sub print_now {
    my $date = strftime '%Y/%m/%d %H:%M:%S', localtime;
    my $t = Time::HiRes::time;
    $date .= sprintf ".%03d", ($t-int($t))*1000;
    print $date."\n";
}

print_now();
Time::HiRes::sleep(0.5);
print_now();
Time::HiRes::sleep(0.5);
print_now();
Time::HiRes::sleep(0.5);
