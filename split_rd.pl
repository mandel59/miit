#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use open ":utf8";
use open ":std";
while (<>) {
  my @list = split(',');
  my @readings = split('・', $list[13]);
  foreach my $r (@readings) {
    print $list[0], ',', $r, "\n";
  }
}

