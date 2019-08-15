#!/usr/bin/env perl

use strict;
use warnings;

sub trim {
    my $s = shift;
    $s =~ s/^\s+|\s+$//g;
    return $s;
};

sub ltrim {
    my $s = shift;
    $s =~ s/^\s+//;
    return $s;
};

sub rtrim {
    my $s = shift;
    $s =~ s/\s+$//;
    return $s;
};

my $some_str = "   hello world   ";
print "===$some_str===\n"; # ===   hello world   ===

my $trimmed_str = trim($some_str);
print "===$trimmed_str===\n"; # ===hello world===

my $ltrimmed_str = ltrim($some_str);
print "===$ltrimmed_str===\n"; # ===hello world   ===

my $rtrimmed_str = rtrim($some_str);
print "===$rtrimmed_str===\n"; # ===   hello world===


