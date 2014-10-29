use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => "Codex",
    VERSION_FROM => "Codex.pm",
    PREREQ_PM => {
    	"Mouse" => "2.4.1",
    	"Mojolicous" => "5.55",
    }
);