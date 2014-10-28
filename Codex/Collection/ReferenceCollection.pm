package Codex::Collection::ReferenceCollection;
use Mouse;
extends 'Codex::Collection';

has '+items' => (
	isa => 'ArrayRef[Codex::Reference]'
);

1;