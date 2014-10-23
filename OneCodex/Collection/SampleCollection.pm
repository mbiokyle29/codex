package OneCodex::Collection::SampleCollection;
use Mouse;

has 'samples' => (
	isa => 'ArrayRef[OneCodex::Sample]',
	is  => 'rw'
);

# Search the collection
# can specfiy a search key and optional field to look in
# default it all
sub search {
	my ($self, $key, $field) = @_;
	
	foreach my $sample ($self->samples) {
		
	}

}