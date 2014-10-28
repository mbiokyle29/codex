#!/usr/bin/perl
use warnings;
use strict;
use Test::Simple tests => 3;
use lib "../";
use Codex;

# Build and check connectivity
ok(my $codex = Codex->new(api_key => shift), "Initalized api object");
ok(my $uploaded_id = $codex->upload("test.fq"), "Uploaded successfully");
ok($codex->get_sample($uploaded_id)->filename eq "test.fq", "refetched uploaded file");
