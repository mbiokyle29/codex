Codex
--------------------------------------------
<strong> Note: This is an unofficial module for interacting with the One Codex platform </strong><br><br>

<h3>A Perl module for consuming the One Codex API<h3>

<h4>Requires:</h4>
the Mojolicous web framework - <a href="http://mojolicio.us/">link</a><br>
the light-weight Mouse object framework  - <a href="http://search.cpan.org/~gfuji/Mouse-2.4.1/lib/Mouse.pm">link</a><br>

<h4>Description:</h4>
This module provides a wrapper around the One Codex REST api. It simplifies api calls by abstracting away the curl calls into simple method calls. It also provides Mouse objects for all of the api objects (Samples, Analyses, References etc), and typed Collections for working with sets of these objects. Allows for simple integration of the One Codex api into existing pipelines.

<h4>Installation:</h4>

```bash
  git clone https://github.com/mbiokyle29/codex/
  cd codex
  perl MakeFile.PL
  sudo make
  sudo make install
```

<h4>Useage:</h4>

```perl
  use Codex;
  
  # Create instance, supplying your API key
  my $codex = Codex->new(api_key => "API KEY");
  
  # Fetch a sample by sample id
  # returns a Codex::Sample object
  my $sample = $codex->get_sample("SAMPLE ID");
  
  # Fetch all samples for authenticated user
  # returns a Codex::Collection object of type Sample
  my $sample_collecion = $codex->get_samples;
  
  # Get all of the samples in the collection that are completed
  my $array = $sample_collection->completed_samples # Returns an array of samples

  # Search the sample collection using a hash ref
  # the keys are the fields to search, values are what to match, can be regex

  # This searches the sample collection for all samples whos filename matches the regex
  my $fasta_samples = $sample_collection->search( { filename => '.*\.fasta$' } );

  # Process each sample
  while(my $sample = $sample_collection->pop) {
      # Iterate through the samples
  }
  
  # upload a read file
  my $uploaded_id = $codex->upload("my_sample_reads.fasta");

  # Download raw data
  $codex->get_raw_analysis("SAMPLE ID");
```

