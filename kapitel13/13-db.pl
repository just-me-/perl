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


my $sql_create = qq| CREATE TABLE vortrag(
			vortrag_id INTEGER, 
			titel VARCHAR(127),
			speicher_id INTEGER,
			minuten INTEGER ) |;
my $resultcode_create = $dbh->do($sql_create);

#person_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY

$dbh->disconnect; 

