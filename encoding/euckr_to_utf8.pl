#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use FindBin;

use Encode qw(decode encode encode_utf8);

my $str = `cat $FindBin::Bin/euckr.txt`;
print $str."\n";
print euckr_to_utf8($str);

sub euckr_to_utf8 {
    my $str = shift;
    $str = encode_utf8(decode("euc-kr", $str));
    return $str;
}
