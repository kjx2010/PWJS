#!/usr/bin/perl
use strict;
use warnings;

my $directory = $ARGV[0];

if (not defined $directory) {
  $directory = './';
}

opendir (DIR, $directory) or die "Error: $!\n";

while (my $file = readdir(DIR)) {
    print "$file\n";
}

closedir(DIR);
