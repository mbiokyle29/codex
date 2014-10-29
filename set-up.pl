#!/usr/bin/perl
use warnings;
use strict;
use File::Slurp;
use Data::Printer;
use feature qw|say|;

my $api = shift;
my @tests = grep(/.*\.t$/,read_dir("./t"));

foreach my $test_file (@tests) {
	my @code = read_file("./t/".$test_file);
	foreach my $line (@code) {
		if($line =~ s/shift/$api/) {
			last;
		}
	}
	write_file("./t/".$test_file, @code);
}