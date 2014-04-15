#!/usr/bin/perl -w
# P(lain) O(ld) D(ocumentation)

&sayHi; 

=pod

=head1 sayHi
Ich bin ein Header.

=head2 Beschreibung
Und ich bin der zweite Header.
	aber ich hab noch einen Tab vorher. 
=cut
sub sayHi{
	print "Hello, world\n";	
}


