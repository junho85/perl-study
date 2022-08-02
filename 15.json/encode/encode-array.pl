#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use JSON;

test();
test2();
test3();
test4();
test5();
test6();

sub test {
    my @arr = ("hello", "world", "nice", "to", "meet", "you");

    print encode_json(\@arr);
    # ["hello","world","nice","to","meet","you"]
    print "\n";
}

sub test2 {
    my @arr = ("hello", "world", "nice", "to", "meet", "you");

    my %data = (
        id   => "myid",
        data => \@arr
    );

    print encode_json(\%data);
    # {"id":"myid","data":["hello","world","nice","to","meet","you"]}
    print "\n";
}

sub test3 {
    my %data = (
        id   => "myid",
        data => [ "hello", "world", "nice", "to", "meet", "you" ]
    );

    print encode_json(\%data);
    # {"id":"myid","data":["hello","world","nice","to","meet","you"]}
    print "\n";
}

sub test4 {
    my $anon_array = [ "hello", "world", "nice", "to", "meet", "you" ];
    my %data = (
        id   => "myid",
        data => $anon_array
    );

    print encode_json(\%data);
    # {"id":"myid","data":["hello","world","nice","to","meet","you"]}
    print "\n";
}

sub test5 {
    my $anon_array = [ "hello", "world", "nice", "to", "meet", "you" ];
    my $data = {
        id   => "myid",
        data => $anon_array
    };

    print encode_json($data);
    # {"id":"myid","data":["hello","world","nice","to","meet","you"]}
    print "\n";
}

sub test6 {
    my @array_of_hashes = (
        {
            id   => "myid1",
            name => "myname1"
        },
        {
            id   => "myid2",
            name => "myname2"
        },
        {
            id   => "myid3",
            name => "myname3"
        }
    );

    print encode_json(\@array_of_hashes);
    print "\n";
}

