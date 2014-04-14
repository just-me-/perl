#!/usr/bin/perl -w

# Mindestens ein a gefolgt von beliebig vielen b
# m/a+b*/g  #m kann - und wird auch meist - weggelassen 
#
# Eine beliebige Anzahl von Backslashes (\) gefolgt von einer beliebigen anzahl von Sternen
# m/\\*\**/g
# 
# Drei aufeianderfolgende Kopien des Strings der in $what enthalten ist
# m/($what){3}/o

$count = 0; #Anzahl Vokale
$words = 0; #Anzahl Woerte mit 2x Doppelbuchstaben

open(WORDS, "<words.txt") || die "Datei nicht gefunden\n";
while (<WORDS>){
	$count++ if (/a/i and /e/i and /i/i and /o/i and /u/i); 
	$words++ if (/(.)\1.*(.)$2.*/);
}
close(WORDS);

print "Anzahl mit Vokalen: $count\n Anzahl Woerter mit 2x doppelt: $words";


