
use strict;
use warnings;

use 5.006000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Simple socket transport for Test::Reporter",
  "AUTHOR" => "Chris Williams <chris\@bingosnet.co.uk>",
  "BUILD_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.42",
    "Test::More" => "0.47"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.42"
  },
  "DISTNAME" => "Test-Reporter-Transport-Socket",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Test::Reporter::Transport::Socket",
  "PREREQ_PM" => {
    "IO::Socket::INET" => 0,
    "Storable" => 0,
    "Test::Reporter" => "1.57",
    "Test::Reporter::Transport" => "1.57"
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "0.22",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



