#!/usr/bin/perl -w

%farbenspiel = (
	rot => "Rose",
	blau => "Himmel",
	gelb => "Sonne",
);

@farben = keys(%farbenspiel);
print qq|Im System sind folgende Farben vorhanden: |;
foreach(@farben){
	print qq|$_\n|;
}

print qq|Geben Sie eine Farbe ein: |;
chomp($farbe = <STDIN>); #entfernt alle Sonderzeichen; Newline

print $farbenspiel{$farbe};

