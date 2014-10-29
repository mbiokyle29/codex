package Codex::Collection::AnalysisCollection;
use Mouse;
extends 'Codex::Collection';

has '+items' => (
	isa => 'ArrayRef[Codex::Analysis]',
);

__PACKAGE__->meta->make_immutable();
1;