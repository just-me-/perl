#!/usr/bin/perl -w

use strict;
use English;
use v5.10;

my %hash; 

open (DF, "df -k |");
while(<DF>){
	my @tmp = split(m/\s+/, $_);
	$tmp[4] =~ s/%//;
	$hash{$tmp[5]}=$tmp[4] if $tmp[5] ne "Mounted";
}
close(DF);
 
while((my $k,my $v) = each %hash ){
	print "$k => $v%\n";
	print "Achtung! $k hat 80% ueberschritten!\n" if $v>80; 
}

