package Codex;
use Mouse;
use Data::Printer;
use feature 'say';

# API objects
use Codex::Analysis;
use Codex::Reference;
use Codex::Sample;
use Codex::Collection;
use Codex::TableEntry;

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

# upload
# file -> filename of the file to upload
# returns id of sample uploaded or -1
sub upload {
	my ($self, $file) = @_;
	
	# Make sure file exists
	unless (-e $file) {
		say "$file does not exist!";
		return -1;
	}

	# Build and send request
	my $end_point = $self->api_root."upload";
	my $post_id = $self->post($end_point, $file);
	if($post_id) {

	}
}

## Samples

# Get all samples
sub get_samples {
	my $self = shift;

	# Set up URL
	my $end_point = $self->api_root."samples";
	my $res = $self->get($end_point);
	if($res) {
		foreach my $sample_json (@$res) {
			my $sample = Codex::Sample->new($sample_json);
		}		
	}
}

# Get one sample by id
# id -> id for sample to fetch
sub get_sample {
	my ($self, $id) = @_;

	# Set up URL
	my $end_point = $self->api_root."samples/$id";
	my $res = $self->get($end_point);
	if($res) {
		my $sample = Codex::Sample->new($res);
		return $sample;		
	}
}

## Analyses

# Get all analyses
sub get_analyses {
	my $self = shift;

	# Set up URL
	my $end_point = $self->api_root."analyses";
	my $res = $self->get($end_point);
	
	if($res) {

	}
}

# Get one analysis by id
# id -> id for analysis to fetch
sub get_analysis {
	my ($self, $id) = @_;

	# Set up URL
	my $end_point = $self->api_root."analyses/$id";
	my $res = $self->get($end_point);
	
	# returns -1 if error
	if($res) {
		my $analysis = Codex::Analysis->new($res);		
	}
}

# Get one raw analysis by id
# id -> id to fetch
## TODO FIX ME
sub get_raw_analysis {
	my ($self, $id) = @_;

	# Set up URL
	my $end_point = $self->api_root."analyses/$id/raw";
	my $res = $self->_ua->get($end_point)->res;
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
	my $res = $self->get($end_point);
	
	if($res) {
		foreach my $entry (@$res) {
			my $table = Codex::TableEntry->new($entry);
		}		
	}
}

## References

# Get all references
sub get_references {
	my $self = shift;

	# Set up URL
	my $end_point = $self->api_root."references";
	my $res = $self->get($end_point);
	if($res) {

	}
}

# Get one reference by id
# id -> id for reference to fetch
sub get_reference {
	my ($self, $id) = @_;

	# Set up URL
	my $end_point = $self->api_root."references/$id";
	my $res = $self->get($end_point);
	if($res) {
		my $reference = Codex::Reference->new($res);
	}
}

## Private ##

# Initalize user agent instance
sub _build_ua {
	return Mojo::UserAgent->new->max_redirects(5);
}

# Wrapper for making api get calls
# (Calls via _ua and handles error)
# Returns json res or -1 (error)
sub get {
	my ($self, $end_point) = @_;

	# response object to check
	my $res = $self->_ua->get($end_point)->res;

	if($res->code eq 404 ) {
		say "Error: nothing returned from API";
		return -1;
	} else {
		return $res->json;
	}
}

# Wrapper for making api post calls
# (Calls via _ua and handles error)
# Returns id of uploaded or -1 (error)
sub post {
	my ($self, $end_point, $file) = @_;
	
	my $res = $self->_ua->post(
		$end_point => {'Content-Type' => 'multipart/form-data'} => 
		form => {filename => {file => $file}}
	)->res;

	if($res->code eq 404 ) {
		say "Error: could not upload file";
		return -1;
	} else {
		return $$res->json{sample_id};
	}
}

1;
