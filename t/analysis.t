#!/usr/bin/perl
use warnings;
use strict;
use Test::Simple tests => 4;
use lib "../";
use Codex;

# Build and check connectivity
ok(my $codex = Codex->new(api_key => shift), "Initalized api object");

## analyses
ok(my $analysis = $codex->get_analysis("2a6b7d276ef041cd"), "Fetched one analysis");
ok($analysis->analysis_status eq "Failed", "Analysis object built, expected status matches");
ok($codex->get_raw_analysis("8d7307f2774c4652"), "downloaded raw file ok!");