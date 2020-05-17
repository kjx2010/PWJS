#!/usr/bin/perl
use strict;
use warnings;
use Time::Piece;

print "Path for ICS file: ";
my $path = <STDIN>;
chomp $path;

open(my $fh, '<:encoding(UTF-8)', $path) or die "Could not open file '$path' $!";

my $t1;
my $t2;
my $count;

while (my $row = <$fh>) {
    if ($row =~ m[DTSTART;TZID]){
        chomp $row;
        $row =~ s/\s+//g;
        $row = substr($row, -6);
        print "$row\n";
        $t1 = Time::Piece->strptime( $row, "%H%M%S" );
        print "$t1\n";
    }
    if ($row =~ m[DTEND;TZID]){
        chomp $row;
        $row =~ s/\s+//g;
        $row = substr($row, -6);
        print "$row\n";
        $t2 = Time::Piece->strptime( $row, "%H%M%S" );
        print "$t2\n";
        my $lessonHours = (($t2 - $t1) / 60) / 45;
        $count += int $lessonHours;
        print "$count\n";       
    }
}

print "The total number of lesson hours in this semester is $count\n";