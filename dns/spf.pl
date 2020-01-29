#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

use Mail::SPF::Query;

my $query = new Mail::SPF::Query()