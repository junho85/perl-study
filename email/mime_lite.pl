use strict;
use warnings;

use MIME::Lite;

my $from = '"테스트" <junho85@daum.net>';
my $to = 'jworld2000@daum.net';
my $subject = "테스트 메일 입니다.";
my $contents = "테스트 메일 내용 입니다.<br>어쩌고 저쩌고";

my $msg = mime_msg($from, $to, $subject, $contents);

my $raw_msg = $msg->as_string;

print $raw_msg;

sub mime_msg {
    my $from = shift;
    my $to = shift;
    my $subject = shift;
    my $contents = shift;

    my $msg = MIME::Lite->new(
        From    => $from,
        To      => $to,
        Subject => $subject,
        Type    => 'multipart/mixed'
    );

    $msg->attach(
        Type     => 'text/html',
        Data     => $contents
    );
    return $msg;
}