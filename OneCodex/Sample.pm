package OneCodex::Sample;
use Mouse;

use DateTime;

# string The unique sample id
has 'id' => (
	isa => 'Str', 
	is => 'ro', 
	required => 1
);

# string The filename of the uploaded sample
has 'filename'  => (
	isa => 'Str', 
	is => 'ro', 
	required => 1
);

# string Human-readable size of the uploaded sample's underlying file, e.g., 4.5MB
has 'size' => (
	isa => 'Str',
	is => 'ro',
	required => 1
);

# int Size of the upload in bytes
has 'size_bytes'  => (
	isa => 'Int',
	is => 'ro',
	required => 1
);

# string Date and time of the upload (in UTC)
has 'upload_date' => (
	isa =>'Str',
	is => 'ro',
	required => 1
);


# string Status of the upload, e.g., "Successfully uploaded." or "Uploading and processing..."
has 'upload_status' => (
	isa => 'Str', 
	is => 'ro', 
	required => 1
);


1;