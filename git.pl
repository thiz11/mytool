#!/usr/bin/perl -w

use strict;
use warnings;
use Net::GitHub::V3;
die unless $ARGV[0];
die unless ( ($ENV{GITHUB_USER} and $ENV{GITHUB_PASS}) or $ENV{GITHUB_ACCESS_TOKEN} );
use Net::GitHub;

    # suggested
    # use OAuth to create token with user/pass
   my $github = Net::GitHub->new(  # Net::GitHub::V3
       access_token => $ENV{GITHUB_ACCESS_TOKEN}
   );

my $nm1 = $ARGV[0];
    my @repos = $github->repos->list;
    my $rp = $github->repos->create( {
               "name" => "$nm1",
               "description" => " ",
#               "homepage" => "https://github.com/thiz11/$nm1"
           } );
  print(\$nm1);
1;
