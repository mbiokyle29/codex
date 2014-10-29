Codex
--------------------------------------------
A Perl lib for working with the OneCodex API. Powered by Mouse!

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
  my $codex = Codex->("API KEY");
  
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

