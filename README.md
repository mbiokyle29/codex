Codex
--------------------------------------------
A Perl module for working with the OneCodex API<br>
Requires: <br>
the Mojolicous web framework - <a href="http://mojolicio.us/">link</a><br>
the light-weight Mouse object framework  - <a href="http://search.cpan.org/~gfuji/Mouse-2.4.1/lib/Mouse.pm">link</a><br>

Description:<br>
This module provides a wrapper around the OneCodex REST api. It simplifies api calls by abstracting away the curl calls into simple method calls. It also provides Mouse objects for all of the api objects (Samples, Analyses, References etc), and typed Collections for working with sets of these objects. Allows for simple integration of the OneCodex api into existing pipelines.

Installation:<br>
```bash
  git clone https://github.com/mbiokyle29/codex/
  cd codex
  perl MakeFile.PL
  sudo make
  sudo make install
```

Useage:<br>
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
  
  # Process each sample
  while(my $sample = $sample_collection->pop) {
    # do things
  }
  
  # upload a read file
  my $uploaded_id = $codex->upload("my_sample_reads.fasta");

  # Download raw data
  $codex->get_raw_analysis("SAMPLE ID");
```

