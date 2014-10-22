#!/usr/bin/perl
use warnings;
use strict;
use Test::Simple tests => 3;
use feature qw|say|;
use Data::Printer;
use File::Slurp;
use OneCodex;

ok(my $codex = OneCodex->new(api_key => shift), "Initalized api object");
ok($codex->connected() == 1, "Established connection with one codex");
ok(my $sample = $codex->get_sample("9b2e28b5f899495e"));
p($sample);