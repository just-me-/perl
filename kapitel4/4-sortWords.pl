#!/usr/bin/perl -w

my @myStrigs; 
my $i = 0;

open(LIST, "<4-sortWords.txt") || die "Datei nicht gefunden\n";
while (<LIST>){
	print $_;
	push (@myStrings, $_);
}
print qq|\nSortiert:\n|;
foreach(sort @myStrings){
	print $_;
}
close(LIST);

