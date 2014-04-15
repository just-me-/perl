#!/usr/bin/perl -w

use strict;
use English;
use v5.10;

open (DF, "| df -h");

while(<DF>){
	print $_;
}

close(DF); 

