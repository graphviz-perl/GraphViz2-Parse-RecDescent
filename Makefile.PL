use strict;
use warnings;
use ExtUtils::MakeMaker;

my $repo = 'graphviz-perl/GraphViz2-Parse-RecDescent';
WriteMakefile(
  AUTHOR => 'Ron Savage (ron@savage.net.au)',
  ABSTRACT => "Use GraphViz2 to visualize a Parse::RecDescent grammar",
  MIN_PERL_VERSION => 5.010001,
  NAME => 'GraphViz2::Parse::RecDescent',
  PREREQ_PM => {
    'GraphViz2' => '2.62',
    'Moo' => '2.001001',
    'Parse::RecDescent' => 1.965001,
  },
  TEST_REQUIRES => {
    'Test::More' => 1.001002,
    'Test::Snapshot' => '0.06',
  },
  VERSION_FROM => 'lib/GraphViz2/Parse/RecDescent.pm',
  LICENSE => 'perl',
  META_MERGE => {
    'meta-spec' => { version => 2 },
    resources => {
      dynamic_config => 0,
      bugtracker => { web => "https://github.com/$repo/issues" },
      license => 'http://dev.perl.org/licenses/',
      repository => {
        type => 'git',
        url => "https://github.com/$repo.git",
        web => "https://github.com/$repo",
      },
    },
    prereqs => {
      develop => {
        requires => {
          'Test::Pod' => 1.48,
          'Pod::Markdown' => 0,
        },
      },
    },
  },
);

sub MY::postamble {
  return '' if !-e '.git';
  <<EOF;
pure_all :: README.md

README.md : \$(VERSION_FROM)
\tpod2markdown \$< >\$\@
EOF
}
