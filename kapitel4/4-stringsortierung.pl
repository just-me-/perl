#!/usr/bin/perl -w

#use strict;
#use English; 

#use vars qw /
#	@array
#/;

print qq|Geben Sie Worte, getrennt durch ein Leerzeichen ein, welche sortiert werden sollen: |;
$string = <>;

@array = split(" ", $string);

#Oder:
#print "Eingabe mit ^D abschliessen";
#@array = <>;

print qq|Ihre Eingaben: \n|;
&printArray;

@array=reverse(@array);
print qq|\nIhre vertauschte Eingabe lautet: \n|;
&printArray;

sub printArray{
	foreach(@array){
        	print qq|$_ \n|;
	}
}

