#!/usr/bin/perl -w

# Mindestens ein a gefolgt von beliebig vielen b
# m/a*b*/g  #m kann - und wird auch meist - weggelassen 
#
# Eine beliebige Anzahl von Backslashes (\) gefolgt von einer beliebigen anzahl von Sternen
# m/\\*\**/g
# 
# Drei aufeianderfolgende Kopien des Strings der in $what enthalten ist
# m/$what/o

$count = 0; #Anzahl Vokale

open(WORDS, "<words.txt") || die "Datei nicht gefunden\n";
while (<WORDS>){
	$count++ if (/a/i and /e/i and /i/i and /o/i and /u/i); 
}
close(WORDS);

print "Anzahl: $count";


