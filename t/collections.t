#!/usr/bin/perl
use warnings;
use strict;
use Test::Simple tests => 7;
use lib "../";
use Codex;

# Build and check connectivity
ok(my $codex = Codex->new(api_key => shift), "Initalized api object");

## Collections
ok(my $sample_col = $codex->get_samples(), "Fetched all samples and created collection");
ok(my $sample = $sample_col->pop(), "Popped an element");
ok(my $name = $sample->filename, "Sample object returned by pop");
ok(my $analyses_col = $codex->get_analyses(), "Fetched all analyses and created collection");
ok(my $reference_col = $codex->get_references(), "Fetched all references and created collection");
ok(my $table = $codex->get_table_analysis("8d7307f2774c4652"), "Fetched table collection");