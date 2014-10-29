package Codex::Collection::SampleCollection;
use Mouse;
extends 'Codex::Collection';

has '+items' => (
	isa => 'ArrayRef[Codex::Sample]'
);

__PACKAGE__->meta->make_immutable();
1;