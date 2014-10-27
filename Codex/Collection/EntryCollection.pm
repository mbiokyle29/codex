package Codex::Collection::EntryCollection;
use Mouse;

has 'samples' => (
	isa => 'ArrayRef[Codex::TableEntry]',
	is  => 'ro'
);

# Search the collection
# can specfiy a search key and optional field to look in
# default it all
sub add {
	my ($self, $entry) = @_;
	n

}