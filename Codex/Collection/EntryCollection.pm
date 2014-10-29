package Codex::Collection::EntryCollection;
use Mouse;
extends 'Codex::Collection';

has '+items' => (
	isa => 'ArrayRef[Codex::TableEntry]',
);

__PACKAGE__->meta->make_immutable();
1;