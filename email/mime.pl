#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use MIME::Base64;

use Encode qw(decode encode encode_utf8);

my $content = "안녕하세요. 반갑습니다. 오늘은 또 무슨일이 생길까?";

print encode_utf8(qq{=== MIME::Base64::encode(encode_utf8("$content"))\n});
print MIME::Base64::encode(encode_utf8($content));
print "\n";
# 7JWI64WV7ZWY7IS47JqULiDrsJjqsJHsirXri4jri6QuIOyYpOuKmOydgCDrmJAg66y07Iqo7J28
# 7J20IOyDneq4uOq5jD8=

print "=== encode MIME-B name\n";
print encode("MIME-B", $content);
print "\n\n";
# =?UTF-8?B?7JWI64WV7ZWY7IS47JqULiDrsJjqsJHsirXri4jri6QuIOyYpOuKmOydgCA=?=
#  =?UTF-8?B?65iQIOustOyKqOydvOydtCDsg53quLjquYw/?=

print "=== decode\n";
print encode_utf8(decode("MIME-B", "=?UTF-8?B?7JWI64WV7ZWY7IS47JqULiDrsJjqsJHsirXri4jri6QuIOyYpOuKmOydgCA=?=
 =?UTF-8?B?65iQIOustOyKqOydvOydtCDsg53quLjquYw/?="));
print "\n\n";
# 안녕하세요. 반갑습니다. 오늘은 또 무슨일이 생길까?

print "=== MIME::Base64::decode\n";
print MIME::Base64::decode("7JWI64WV7ZWY7IS47JqULiDrsJjqsJHsirXri4jri6QuIOyYpOuKmOydgCDrmJAg66y07Iqo7J28
7J20IOyDneq4uOq5jD8=");
print "\n\n";
# 안녕하세요. 반갑습니다. 오늘은 또 무슨일이 생길까?

my $subject = "[기간연장안내]7일 후 프리미엄메일이 종료됩니다.";
print "=== MIME::Base64 subject\n";
print MIME::Base64::encode("utf8", $subject);
print "\n";

print "encode MIME-B encode_utf8 subject\n";
my $encoded2 = encode("MIME-B", encode_utf8($subject));
print $encoded2."\n";
print "\n";

print decode("MIME-B", $encoded2);
print "\n";
