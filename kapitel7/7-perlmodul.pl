#!/usr/bin/perl -w

push(@INC, "/home/kurs12/www/perl/kapitel7"); 
foreach(@INC){
	print "$_ \n";
}

use SL::PM;

&myWorld;

