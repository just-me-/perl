#!/usr/bin/perl -w

$pi = 3.14159; 
#$radius = 12.5; 
print qq|Geben Sie den Radius ein: |;
$radius = <STDIN>;
$umfang = 2*$pi*$radius;

print qq|Der Umfang des Kreises mit dem Radius $radius betraegt $umfang\n|;

