#!/usr/bin/perl -w

print qq|Temperatur: |;
$temp = <STDIN>;

print "Es ist zu kalt!\n" if $temp<20; 
print "Es passt.\n" if ($temp >=20) && ($temp <=30);
print "Es ist zu heiss!\n" if $temp > 30;

