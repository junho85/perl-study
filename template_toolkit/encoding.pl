#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

binmode STDOUT, ":utf8";

use Template;

use FindBin;

my $tt = Template->new({
    ENCODING => 'utf8',
    INCLUDE_PATH => ["$FindBin::Bin/templates",],
}) || die "$Template::ERROR\n";

my $vars = {

};

my $output;
$tt->process("main.html", $vars, \$output) || die $tt->error(), "\n";
print $output;