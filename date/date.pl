#!/usr/bin/perl

use strict;
use warnings;

use POSIX; # Portable Operating System Interface for UniX 포식스

# 오늘 포함 4일 전 까지 출력
for (my $i=0; $i<5; $i++) {
    print strftime "%F", localtime(get_date_ago($i));
    print "\n";
}

# n일전 날짜 구하기
sub get_date_ago {
    my $ago = shift;

    my $epoc = time();
    $epoc = $epoc - (24 * 60 * 60) * $ago;
    return $epoc;
}
