package Codex;
use Mouse;
use Data::Printer;
use feature 'say';

# API objects
use Codex::Analysis;
use Codex::Reference;
use Codex::Sample;
use Codex::Collection;

# For api calls
use Mojo::UserAgent;

has 'api_key' => (
	isa => 'Str', 
	is => 'ro', 
	required => 1
);

has 'api_root'  => (
	isa => 'Str', 
	is => 'ro', 
	lazy => 1, 
	builder => sub { return "https://".shift->api_key.":\@beta.onecodex.com/api/v0/"; }
);

# Private instance of mojo ua for making api calls
has '_ua' => (
	isa => 'Mojo::UserAgent', 
	is => 'ro', 
	builder => '_build_ua', 
	lazy => 1
);

# Test connectivity
sub connected {
	my $self = shift;
	my $res = $self->_ua->get('https://onecodex.com')->res;

	# Check for 2xx HTTP code
	return $res->code =~ m/2[0-9]{2}/;
}

# Upload
sub upload {
	my ($self, $file) = @_;
	
	# Make sure file exists
	unless (-e $file) {
		say "$file does not exist!";
		return;
	}

	# Build and send request
	my $end_point = $self->api_root."upload";
	
	my $post = $self->_ua->post(
		$end_point => {'Content-Type' => 'multipart/form-data'} => 
		form => {filename => {file => $file}}
	)->res->json;
	
	return $$post{sample_id};
}

## Samples

# Get all samples
sub get_samples {
	my $self = shift;

	# Set up URL
	my $end_point = $self->api_root."samples";
	my $res = $self->_ua->get($end_point)->res->json;
	return $res;
}

# Get one sample by id
# id -> id for sample to fetch
sub get_sample {
	my ($self, $id) = @_;

	# Set up URL
	my $end_point = $self->api_root."samples/$id";
	my $res = $self->_ua->get($end_point)->res->json;
	my $sample = OneCodex::Sample->new($res);
	return $sample;
}

## Analyses

# Get all analyses
sub get_analyses {
	my $self = shift;

	# Set up URL
	my $end_point = $self->api_root."analyses";
	my $res = $self->_ua->get($end_point)->res->json;
	return $res;
}

# Get one analysis by id
# id -> id for analysis to fetch
sub get_analysis {
	my ($self, $id) = @_;

	# Set up URL
	my $end_point = $self->api_root."analyses/$id";
	my $res = $self->_ua->get($end_point)->res->json;
	my $analysis = OneCodex::Analysis->new($res);
}

# Get one raw analysis by id
# id -> id to fetch
sub get_raw_analysis {
	my ($self, $id) = @_;

	# Set up URL
	my $end_point = $self->api_root."analyses/$id/raw";
	my $res = $self->_ua->max_redirects(5)->get($end_point)->res;
	$res->content->asset->move_to("$id-results.tsv.gz");
	

	if($res->code == 404) {
		die "Analysis $id was not found";
	}
}

# Get one table analysis by id
# id -> id to fetch
sub get_table_analysis {
	my ($self, $id) = @_;

	# Set up URL
	my $end_point = $self->api_root."analyses/$id/table";
	my $res = $self->_ua->get($end_point)->res;
	p($res->json);
	return $res;
}

## References

# Get all references
sub get_references {
	my $self = shift;

	# Set up URL
	my $end_point = $self->api_root."references";
	my $res = $self->_ua->get($end_point)->res->json;
	return $res;
}

# Get one reference by id
# id -> id for reference to fetch
sub get_reference {
	my ($self, $id) = @_;

	# Set up URL
	my $end_point = $self->api_root."references/$id";
	my $res = $self->_ua->get($end_point)->res->json;
	my $reference = OneCodex::Reference->new($res);
}

## Private ##

# Initalize user agent instance
sub _build_ua {
	return Mojo::UserAgent->new();
}

1;
