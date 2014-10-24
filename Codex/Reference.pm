package Codex::Reference;
use Mouse;

# string Unique string id
has 'id' => (
	isa => 'Str', 
	is => 'ro', 
	required => 1
);

# string Description of the reference database
has 'description' => (
	isa => 'Str', 
	is => 'ro', 
	required => 1
);

# string Short human-readable name of the reference
has 'name' => (	
	isa => 'Str', 
	is => 'ro', 
	required => 1
);

1;