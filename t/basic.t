#!/usr/bin/perl
use warnings;
use strict;
use Test::Simple tests => 1;
use lib "../";
use Codex;

# Build and check connectivity
ok(my $codex = Codex->new(api_key => shift), "Initalized api object");
