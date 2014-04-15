#!/usr/bin/perl -w

use v5.10;

# Gibt alle Benutzer aus, welche eine Shell als Loginprogramm haben
my @users; 
my $count = 0;

open(PASSWD, "passwd.txt");
while(<PASSWD>){
	push(@users, $_) if m/bash$/; 
}
close(PASSWD); 

foreach(@users){
	my @user = split(":", $_);
	print $user[0]."\n";
	$count++;
}
say "Es haben $count Benutzer ein Shell als Loginprogramm.";
