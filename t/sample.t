#!/usr/bin/perl
use warnings;
use strict;
use Test::Simple tests => 4;
use lib "../";
use Codex;

# Build and check connectivity
ok(my $codex = Codex->new(api_key => shift), "Initalized api object");

## samples
ok(my $sample = $codex->get_sample("9b2e28b5f899495e"), "Fetched Sample");
ok($codex->get_sample("q3123123123qwedas") == -1, "Handled error code for non existent sample");
ok($sample->filename eq "ebola.fasta", "Sample object built");