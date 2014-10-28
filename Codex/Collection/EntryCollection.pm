package Codex::Collection::EntryCollection;
use Mouse;
extends 'Codex::Collection';

has '+items' => (
	isa => 'ArrayRef[Codex::TableEntry]',
);

1;