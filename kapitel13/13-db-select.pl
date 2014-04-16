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

my $sql = qq|SELECT titel, vortrag_id FROM vortrag where vortrag_id = ?|;
my $sth = $dbh->prepare($sql);

my $id = 1;
$sth->execute($id) or die sth->errstr;

my $anzahl = $sth->rows;
print "Es wurden $anzahl Datensätze gefunden.\n";
# Auslesen mit Array
while(my @row = $sth->fetchrow_array){
	print join(" : ", @row), "\n";
}

$sth->execute($id) or die sth->errstr;
# Auslesen mit Hash
while(my $row = $sth->fetchrow_hashref){
	print $row->{'titel'}."\n";
	#print $$row{'titel'};
}

$dbh->disconnect; 




