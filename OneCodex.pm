package OneCodex;
use Mouse;
use Data::Printer;

# API objects
use OneCodex::Analysis;
use OneCodex::Reference;
use OneCodex::Sample;
use OneCodex::Collection;

# For network call
use Mojo::UserAgent;

has 'api_key'   => (isa => 'Str', is => 'ro', required => 1);
has '_ua'       => (isa => 'Mojo::UserAgent', is => 'ro', builder => '_build_ua', lazy => 1);

has 'api_root'  => (
	isa => 'Str', 
	is => 'ro', 
	lazy => 1, 
	builder => sub { return "https://".shift->api_key.":\@beta.onecodex.com/api/v0/"; }
);

# Test connectivity
sub connected {
	my $self = shift;
	my $res = $self->_ua->get('https://onecodex.com')->res;
	return $res->code =~ m/2[0-9]{2}/;
}

# Authenticate
sub authenticate {
	my $self = shift;
	my $res = $self->_ua->get($self->api_root)->res;
	return $res->code != 401;
}

# Samples
sub get_samples {
	my $self = shift;

	# Set up URL
	my $end_point = $self->api_root."samples";
	my $res = $self->_ua->get($end_point)->res->json;
	p($res);
	return $res;
}
sub get_sample {
	my ($self, $id) = @_;

	# Set up URL
	my $end_point = $self->api_root."samples/$id";
	my $res = $self->_ua->get($end_point)->res->json;
	my $sample = OneCodex::Sample->new($res);
	return $sample;
}

# Initalize user agent instance
sub _build_ua {
	return Mojo::UserAgent->new();
}

1;