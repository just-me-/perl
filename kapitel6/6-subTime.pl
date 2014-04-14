#!/usr/bin/perl -w

print "Welchen Monat?";
$myMonat = <>;
print &getMonat($myMonat);

my ( $sec, $min, $hour, $mday, $mon, $year ) = localtime;
print sprintf "\n%04d%02d%02d", $year+1900, $mon+1, $mday;

sub getMonat{
	$monat = shift; 
	@monate = qw(Nil 
	Januar Februar Maerz April Mai 
	Juni Juli August September Oktober November Dezember) ;
	return $monate[$monat];
}

