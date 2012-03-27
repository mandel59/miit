#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use open ":utf8";
use open ":std";

open(RDST, '<', 'miit_rs.csv') or die("can't open miit_rs.csv");
open(RDNG, '<', 'miit_rd.csv') or die("can't open miit_rd.csv");
open(ZERO, '<', 'miit_0.csv') or die("can't open miit_0.csv");

sub read_radical_stroke {
  my %rdst = ();
  while (<RDST>) {
    chomp();
    my @list = split(',');
    my $mj = $list[0];
    @{$rdst{$mj}} = \() if not exists($rdst{$mj});
    push(@{$rdst{$mj}}, ($list[1], $list[2]));
  }
  return %rdst;
}

my %rdst = &read_radical_stroke();

sub read_readings {
  my %rdng = ();
  while (<RDNG>) {
    chomp();
    my @list = split(',');
    my $mj = $list[0];
    @{$rdng{$mj}} = \() if not exists($rdng{$mj});
    push(@{$rdng{$mj}}, $list[1]);
  }
  return %rdng;
}

my %rdng = &read_readings();

while (<ZERO>) {
  my @list = split(',');
  my $mj = $list[0];
  my @rs = ();
  if (exists($rdst{$mj})) {
    @rs = @{$rdst{$mj}};
  }
  push(@rs, ('','','','','','','',''));
  splice(@list, 4, 0, @rs[0..7]);
  if (exists($rdng{$mj})) {
    splice(@list, 13, 0, join('・', @{$rdng{$mj}}));
  } else {
    splice(@list, 13, 0, '');
  }
  print join(',', @list);
}

