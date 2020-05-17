#!/usr/bin/perl
use strict;
use warnings;
use Time::Piece;
binmode(STDOUT, "encoding(UTF-8)");

#print "Path for first HTML file: ";
#my $path1 = <STDIN>;
my $path1 = 'SPOJ4.html';
chomp $path1;

#print "Path for second HTML file: ";
#my $path2 = <STDIN>;
my $path2 = 'SPOJ5.html';
chomp $path2;

open(my $fh1, '<:encoding(UTF-8)', $path1) or die "Could not open file '$path1' $!";
open(my $fh2, '<:encoding(UTF-8)', $path2) or die "Could not open file '$path2' $!";

my $count = 0;
my $name;
my @array1;
my @array2;

while (my $row = <$fh1>) {
    if ($row =~ m[<td class='mini'><a href='(.*)'>]){
        chomp $row;
        $row =~ s/<td class='mini'><a href='(.*)'>//;
        $row =~ s/<(.*)td>//;
        $row =~ s/^\s+//;
        $row =~ s/\s+$//;
        $name = $row; 
    }
        if ($row =~ m[<td class='mini'>(.*)[.](.*[0-9])</td>]){
        chomp $row;
        $row =~ s/<td class='mini'>//;
        $row =~ s/<(.*)td>//;
        $row =~ s/^\s+//;
        $row =~ s/\s+$//;
        $array1[$count][0] = $name;
        $array1[$count][1] = $row;
        $count = $count + 1;
    }
}

for my $i (0..$count-1) {
    print STDOUT '"';
    print STDOUT "$array1[$i][0]";
    print STDOUT '"';
    print STDOUT ',';
    print STDOUT '"';
    print STDOUT "$array1[$i][1]";
    print STDOUT '"';
    print STDOUT "\n";
}

$count = 0;

while (my $row = <$fh2>) {
    if ($row =~ m[<td class='mini'><a href='(.*)'>]){
        chomp $row;
        $row =~ s/<td class='mini'><a href='(.*)'>//;
        $row =~ s/<(.*)td>//;
        $row =~ s/^\s+//;
        $row =~ s/\s+$//;
        $name = $row; 
    }
        if ($row =~ m[<td class='mini'>(.*)[.](.*[0-9])</td>]){
        chomp $row;
        $row =~ s/<td class='mini'>//;
        $row =~ s/<(.*)td>//;
        $row =~ s/^\s+//;
        $row =~ s/\s+$//;
        $array2[$count][0] = $name;
        $array2[$count][1] = $row;
        $count = $count + 1;
    }
}

for my $i (0..$count-1) {
    print STDOUT '"';
    print STDOUT "$array2[$i][0]";
    print STDOUT '"';
    print STDOUT ',';
    print STDOUT '"';
    print STDOUT "$array2[$i][1]";
    print STDOUT '"';
    print STDOUT "\n";
}