
use strict;
use warnings;

BEGIN { require v5.6.0; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Simple socket transport for Test::Reporter',
  'AUTHOR' => 'Chris Williams <chris@bingosnet.co.uk>',
  'BUILD_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.42',
    'Test::More' => '0.47'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.42'
  },
  'DISTNAME' => 'Test-Reporter-Transport-Socket',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Test::Reporter::Transport::Socket',
  'PREREQ_PM' => {
    'IO::Socket::INET' => '0',
    'Storable' => '0',
    'Test::Reporter' => '1.57',
    'Test::Reporter::Transport' => '1.57'
  },
  'VERSION' => '0.14',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



