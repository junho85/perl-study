use strict;
use warnings;

use Data::Dumper;

sub test_return_arrays_in_array {
    my @arr;

    push @arr, [ 1, 2, 3 ];
    push @arr, [ 4, 5, 6 ];
    push @arr, [ 7, 8, 9 ];

    return @arr;
}

my @arr = test_return_arrays_in_array();

for my $row (@arr) {
    print @$row[0]."\t";
    print @$row[1]."\t";
    print @$row[2]."\t";
    print "\n";
}