#!/usr/bin/perl -w

# mysql -u root

use strict; 
use DBI; 

my $database = "uwp"; 
my $hostname = "localhost";
my $dns = "DBI:mysql:database=$database;host=$hostname";

my $user = "root";
my $pass = "";

my $dbh = DBI::->connect($dns, $user, $pass, 
			{ 'RaiseError' => 1, 'AutoCommit' => 1} )
	or die DBI::errstr;

my $sql_dynamisch = qq|INSERT INTO vortrag (titel) VALUES (?)|;
my $sth = $dbh->prepare($sql_dynamisch);
my $anzahl = 0;
my $titel = '';
until($titel =~ /ende/i){
	print "Vortragstitel: ";
	chomp($titel = <STDIN>);
	unless($titel =~ /ende/i){
		$anzahl = $sth->execute($titel) or warn $dbh->errstr;
		print "Erfolgreiches Einfügen = $anzahl \n" if $anzahl;
	}
}

$dbh->disconnect; 




