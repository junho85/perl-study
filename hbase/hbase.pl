#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';


my $hbase = HBase::JSONRest->new(host => $hostname);

my $records = $hbase->get({
    table   => 'table_name',
    where   => {
        key_begins_with => "key_prefix"
    },
});

print "hello world";