#!/usr/bin/perl -w

print qq|Bitte geben Sie einen String ein: |;
$string = <>;
print qq|Wie oft soll dieser ausgegeben werden?|;
$anzahl = <>;

for($i=0; $i<$anzahl; $i++){
	print $string; 
}


