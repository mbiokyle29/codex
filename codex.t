#!/usr/bin/perl
use warnings;
use strict;
use Test::Simple tests => 15;
use feature qw|say|;
use Data::Printer;
use File::Slurp;
use Codex;

# Build and check connectivity
#ok(my $codex = Codex->new(api_key => shift), "Initalized api object");

# uploads
#ok(my $uploaded_id = $codex->upload("test.fq"), "Uploaded successfully");
#ok($codex->get_sample($uploaded_id)->filename eq "test.fq", "refetched uploaded file");

## samples
#ok(my $sample = $codex->get_sample("9b2e28b5f899495e"), "Fetched Sample");
#ok(my $sample_no = $codex->get_sample("q3123123123qwedas"));
#ok($sample->filename eq "ebola.fasta", "Sample object built");
#ok($codex->get_samples, "got all samples");

## analyses
#ok(my $analyses = $codex->get_analyses(), "Got analyses");
#ok(my $analysis = $codex->get_analysis("2a6b7d276ef041cd"), "Fetched one analysis");
#ok($analysis->analysis_status eq "Failed", "Analysis object built, expected status matches");

## References
#ok(my $references = $codex->get_references(), "Fetched all references");
#ok(my $reference = $codex->get_reference("16027007dcd142ce"), "Fetched one reference by id");
#ok(my $name = $reference->name(), "Reference object built correctly");
#ok($codex->get_raw_analysis("8d7307f2774c4652"));
#ok(my $table = $codex->get_table_analysis("8d7307f2774c4652"));

