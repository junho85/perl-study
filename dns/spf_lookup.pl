#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use Net::DNS;

use Data::Dumper;

my $res = Net::DNS::Resolver->new;

my $domain = "daum.net";
# my @spfs = get_spf_records("daum.net");
# my @spfs = get_spf_records("_spf.daum.net");
my @spfs = get_spf_records("gmail.com");

for my $spf (@spfs) {
    print Dumper($spf)."\n";
}

sub get_spf_records {
    my $domain = shift;

    my $reply = $res->query($domain, 'TXT');

    my @spfs = ();

    for my $txt ($reply->answer) {
        if ($txt->txtdata =~ /^v=spf/) {
            my $item = ();

            my $txtdata = $txt->txtdata;
            my @arr = split(/ /, $txtdata);

            my @ips = ();

            for my $part (@arr) {
                print "[$part]";
                my ($type, $value) = parse_part($part);

                if ($type eq "ip4") {
                    push @ips, $value;
                } elsif ($type eq "include") {
                    my @result = get_spf_records($value);
                    my @result_ips = map {@$_} map {$_->{ips}} @result;
                    push(@ips, @result_ips);
                    # print("===");
                    # print(Dumper(\@result_ips));
                } else {
                    $item->{$type} = $value;
                }
            }
            $item->{ips} = \@ips;

            push(@spfs, $item);
        }
    }
    return @spfs;
}

sub parse_part {
    my $part = shift;
    if ($part =~ /^v=(.*)/) {
        return ("version", $1);
    } elsif ($part =~ /^include:(.*)/i) {
        return ("include", $1);
    } elsif ($part =~ /^ip4:(.*)/i) {
        return ("ip4", $1);
    } elsif ($part =~ /^ip6:(.*)/i) {
        return ("ip6", $1);
    } elsif ($part =~ /^ptr/i) {
        return ("ptr", $part);
    } elsif ($part =~ /^a$/i) {
        return ("a", $part);
    } elsif ($part =~ /^mx/) {
        return ("mx", $part);
    } elsif ($part =~ /all/) {
        return ("all", $part);
    }
}
