package Codex::Collection::SampleCollection;
use Mouse;
extends 'Codex::Collection';


has '+items' => (
	isa => 'ArrayRef[Codex::Sample]'
);

sub completed_samples {
	my $self = shift;
	my @completed;
	foreach my $sample (@{ $self->items }) {
		if($sample->upload_status eq "Successfully uploaded.") {
			CORE::push(@completed, $sample);
		}
	}
	@completed ? return \@completed : return -1;
}

sub processing_samples {
	my $self = shift;
	my @processing;
	foreach my $sample (@{ $self->items }) {
		if($sample->upload_status eq "Uploading and processing...") {
			CORE::push(@processing, $sample);
		}
	}
	@processing ? return \@processing : return -1;
}


__PACKAGE__->meta->make_immutable();
1;