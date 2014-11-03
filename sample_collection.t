#!/usr/bin/perl
use warnings;
use strict;
use Test::Simple tests => 2;
use feature qw|say|;
use Data::Printer;
use File::Slurp;
use Codex;

my $sample1 = Codex::Sample->new(
	id => "1",
	filename => "test1.fasta",
	size => 123,
	size_bytes => 1,
	upload_date => "today",
	upload_status => "Successfully uploaded.",
);

my $sample2 = Codex::Sample->new(
	id => "2",
	filename => "test2.fasta",
	size => 223,
	size_bytes => 2,
	upload_date => "today",
	upload_status => "Successfully uploaded.",
);

my $sample3 = Codex::Sample->new(
	id => "3",
	filename => "test3.fasta",
	size => 323,
	size_bytes => 3,
	upload_date => "today",
	upload_status => "Uploading and processing...",
);

my $sample4 = Codex::Sample->new(
	id => "4",
	filename => "test4.fasta",
	size => 423,
	size_bytes => 4,
	upload_date => "today",
	upload_status => "Uploading and processing...",
);

my $sample_collection = Codex::Collection::SampleCollection->new();
$sample_collection->push($_) for ($sample1, $sample2, $sample3, $sample4);
ok( scalar @{$sample_collection->completed_samples} == 2, "got back 2 completed samples");
ok( scalar @{$sample_collection->processing_samples} == 2, "got back 2 processing samples");
ok( scalar @{$sample_collection->search( {id => 4}   )} == 1, "search found one sample with id => 4");
ok( my $results = $sample_collection->search( {filename => 'test4.fasta'}), "Stored result array from searching file name");
ok( $$results[0]->filename eq "test4.fasta", "searched returned correct sample");
ok( my $reg_res = $sample_collection->search( { filename => '.*[1-3]{1}\.fasta' } ), "searching with regex!" );
ok( my $multi_search = $sample_collection->search( { filename => '.*[1-3]{1}\.fasta', size => '^[2-3]{1}.*'}), "searching with two keys!");
p($multi_search);