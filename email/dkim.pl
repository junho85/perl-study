#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use MIME::Lite;

use Encode qw(decode encode encode_utf8);

use Mail::DKIM::Signer;
use Mail::DKIM::TextWrap;

use FindBin;

# get mime message
my $from = 'from_address@junho85.pe.kr';
my $fromname = "테스트발송자";
my $to = 'to_address@junho85.pe.kr';
my $subject = "테스트 메일 입니다.";
my $contents = "테스트 메일 내용 입니다.<br>어쩌고 저쩌고";

my $msg = mime_msg($from, $fromname, $to, $subject, $contents);
# print $msg->as_string;

# get dkim signature
my $dkim_sign = get_dkim_sign($msg->as_string);
print $dkim_sign->as_string;

sub get_dkim_sign {
    my $raw_data = shift;

    my $dkim = Mail::DKIM::Signer->new(
        Algorithm => "rsa-sha256",
        Method => "relaxed/simple",
        Domain => "junho85.pe.kr",
        Selector => "1439968973.junho85",
        KeyFile => "$FindBin::Bin/dkimkeys/junho85.pe.kr.private.key.pem",
    );

    $raw_data =~ s/\n/\015\012/gs;
    $dkim->PRINT($raw_data);
    $dkim->CLOSE;

    my $sig = $dkim->signature;

    return $sig;
}

sub mime_msg {
    my $from = shift;
    my $fromname = shift;
    my $to = shift;
    my $subject = shift;
    my $contents = shift;

    my $header_from = $from;
    if ($fromname) {
        $header_from = encode("MIME-B", $fromname)." <".$from.">";
    }

    my $msg = MIME::Lite->new(
        From    => $header_from,
        To      => $to,
        Subject => encode("MIME-B", $subject),
        Type    => 'multipart/mixed'
    );

    $msg->attach(
        Type     => 'TEXT',
        Data     => $contents
    );
    return $msg;
}
