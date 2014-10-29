package Codex::Collection;
use Mouse;
use Codex::Collection;

has 'items' => (
	isa => 'ArrayRef',
	is  => 'ro',
	lazy => 1,
	builder => '_build_items'
);

sub push {
	my ($self, $item) = @_;
	my $index = push($self->items, $item) or die "Couldn't push $item into $self";
	return $index;
}

sub pop {
	my $self = shift;
	return pop($self->items) or die "Couldn't pop an element from $self";
}


sub _build_items {
	return [];
}

__PACKAGE__->meta->make_immutable();
1;