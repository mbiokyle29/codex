#!/usr/bin/perl
use warnings;
use strict;
use Test::Simple tests => 5;
use feature qw|say|;
use Data::Printer;
use File::Slurp;
use OneCodex;

ok(my $codex = OneCodex->new(api_key => shift), "Initalized api object");
ok($codex->connected() == 1, "Established connection with one codex");
ok($codex->authenticate() == 1, "Verified api key is valid");
ok(my $sample = $codex->get_sample("9b2e28b5f899495e"), "Fetched Sample");
ok($sample->filename eq "ebola.fasta", "Sample object built");
ok($codex->get_samples, "got samples");