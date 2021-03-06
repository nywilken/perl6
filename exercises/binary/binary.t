#!/usr/bin/env perl6
use v6;
use Test;
use lib IO::Path.new($?FILE).parent.path;

plan 10;
my $module = %*ENV<EXERCISM> ?? 'Example' !! 'Binary';
use-ok $module;
require ::($module) <Binary>;

ok Binary.can('to_decimal'), 'Class Binary has to_decimal method';

my %results = (
    1           => 1,
    10          => 2,
    11          => 3,
    100         => 4,
    1001        => 9,
    11010       => 26,
    10001101000 => 1128,
    'carrot23'  => 0,
);

for %results.sort {
    is Binary.to_decimal($_.key), $_.value, '"' ~ $_.key ~ '" returns ' ~ $_.value;
}
