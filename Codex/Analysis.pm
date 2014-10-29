package Codex::Analysis;
use Mouse;

# string Unique string id
has 'id' => (
	isa => 'Str', 
	is => 'ro', 
	required => 1
);

# string/enum Status of the analysis. "Success", "Pending", or "Failed"
has 'analysis_status' => (
	isa => 'Str', 
	is => 'rw', 
	required => 1
);

# int Number of reads or contigs in the sample
# not required because failed/pending wont have
has 'n_reads' => (
	isa => 'Int',
	is => 'rw',
	required => 0
);

# float Proportion of sample reads mapped against the reference (0 to 1)
# not required because failed/pending wont have
has 'p_mapped' => (
	isa => 'Int',
	is  => 'rw',
	required => 0
);

# string Unique string id of the reference database
has 'reference_id' => (
	isa => 'Str',
	is  => 'ro',
	required => 1
);

# string Human-readable name of the reference database
has 'reference_name' => (
	isa => 'Str',
	is  => 'ro',
	required => 1
);

# string Unique string id of the sample
has 'sample_id' => (
	isa => 'Str',
	is  => 'ro',
	required => 1
);

# string Name of the uploaded sample. By default, this should be the same as the name of the uploaded FASTA or FASTQ file.
has 'sample_filename' => (
	isa => 'Str',
	is  => 'ro',
	required => 1
);

__PACKAGE__->meta->make_immutable();
1;