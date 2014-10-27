Codex
--------------------------------------------
A Perl lib for working with the OneCodex API. Powered by Mouse!

Useage:<br>
```perl
  use Codex;
  
  # Create instance, supplying your API key
  my $codex = Codex->("API KEY");
  
  # Fetch a sample by sample id
  # returns a Codex::Sample object
  my $sample = $codex->get_sample("SAMPLE ID");
  
```

