#!/usr/bin/perl -w

%farbenspiel = (
	rot => "Rose",
	blau => "Himmel",
	gelb => "Sonne",
);

@farben = keys(%farbenspiel);
print qq|Im System sind folgende Farben vorhanden: |;
foreach(@farben){
	print qq|\n$_|;
}

print qq|\nGeben Sie eine Farbe ein: |;
chomp($farbe = <STDIN>); #entfernt alle Sonderzeichen; Newline

defined($farbenspiel{$farbe}) ? print $farbenspiel{$farbe} : print "Farbe nicht vorhanden!";

