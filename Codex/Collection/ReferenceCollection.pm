package Codex::Collection::ReferenceCollection;
use Mouse;
extends 'Codex::Collection';

has '+items' => (
	isa => 'ArrayRef[Codex::Reference]'
);

__PACKAGE__->meta->make_immutable();
1;