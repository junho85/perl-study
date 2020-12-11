#!/usr/bin/perl

use strict;
use warnings;

use FindBin;

my @lines = `cat $FindBin::Bin/download_rename_sample.txt`;
=pod
tab으로 구분

공통	이름	http://test.com/test.html
-> 공통-이름.html
으로 다운로드 받음
=cut

for my $line (@lines) {
    chomp $line;
    my @arr = split(/\t/, $line);
    my $filename = $arr[0].'-'.$arr[1].".html";
    my $url = $arr[2];
    my $cmd = "curl -o '$filename' $url";
    print "$cmd\n";
    system($cmd);
}
