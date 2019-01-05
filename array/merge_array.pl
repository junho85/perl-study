#!/usr/bin/perl

use strict;
use warnings;

my @array1 = (1,2);
my @array2 = (3,4);

my @array3 = ();

push(@array3, @array1);
push(@array3, @array2);

print "@array3\n"; # 1 2 3 4

# 이렇게 해도 같음. 그런데 push 가 좀 더 효과적이고 함. (https://docstore.mik.ua/orelly/perl3/cookbook/ch04_10.htm)
my @array4 = (@array1, @array2);

print "@array4\n"; # 1 2 3 4