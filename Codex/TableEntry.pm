package Codex::TableEntry;
use Mouse;

# string Name of the organism
has 'name' => (
	isa => 'Str',
	is => 'ro'
);

# string Taxonomic rank of the mapped organism
has 'rank' => (
	isa => 'Str',
	is => 'ro'
);

# int Number of reads in the input sample that mapped to this taxonomy ID
has 'readcount' => (
	isa => 'Int',
	is => 'ro'
);

# int NCBI taxonomy ID for the mapped organism
has 'tax_id' => (
	isa => 'Int',
	is => 'ro'
);


1;