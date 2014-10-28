package Codex::Collection::SampleCollection;
use Mouse;
extends 'Codex::Collection';

has '+items' => (
	isa => 'ArrayRef[Codex::Sample]'
);

1;