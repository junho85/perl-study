#!/usr/bin/env perl

use strict;
use warnings;

use Net::SMTP;

my $smtp = Net::SMTP->new('mx1.hanmail.net', Debug => 1);

my $from = 'test@junho85.pe.kr';
my $to = 'junho85@daum.net';

$smtp->mail($from); # from
$smtp->to($to); # to

$smtp->data();
$smtp->datasend("From: $from\n");
$smtp->datasend("To: $to\n");
$smtp->datasend("Subject: this is test mail for perl\n");
$smtp->datasend("\n");
$smtp->datasend("A simple test message\n");
$smtp->dataend();
$smtp->quit;