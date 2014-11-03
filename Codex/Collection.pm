package Codex::Collection;
use Mouse;
use Codex::Collection;

has 'items' => (
	isa => 'ArrayRef[Object]',
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

sub search {
	my ($self, $kv_hash) = @_;
	my @matching;
	foreach my $item (@{ $self->items }) {
		my $match = 1;
		foreach my $key (keys(%$kv_hash)) {
			unless($item->$key =~ m/$$kv_hash{$key}/) {
				$match = 0;	
			}
		}
		CORE::push(@matching, $item) if $match;
	}
	return \@matching;
}


sub _build_items {
	return [];
}

__PACKAGE__->meta->make_immutable();
1;