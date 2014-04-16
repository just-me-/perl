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


my $resultcode_drop = $dbh->do(&dropTable("vortrag"));
my $sql_create = qq| CREATE TABLE vortrag(
			vortrag_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
			titel VARCHAR(127),
			speicher_id INTEGER,
			minuten INTEGER ) |;
my $resultcode_create = $dbh->do($sql_create);

$resultcode_drop = $dbh->do(&dropTable("person"));
$sql_create = qq| CREATE TABLE person(
                        person_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
                        name VARCHAR(240)) |;
$resultcode_create = $dbh->do($sql_create);

$resultcode_drop = $dbh->do(&dropTable("sprecher"));
$sql_create = qq| CREATE TABLE sprecher(
                        sprecher_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
                        name VARCHAR(240),
			person_id INTEGER) |;
$resultcode_create = $dbh->do($sql_create);

$resultcode_drop = $dbh->do(&dropTable("adresse"));
$sql_create = qq| CREATE TABLE adresse(
                        adresse_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
                        person_id INTEGER,
			strasse VARCHAR(240),
			postleizahl INTEGER,
			ort VARCHAR(240),
			land_id INTEGER) |;
$resultcode_create = $dbh->do($sql_create);



$dbh->disconnect; 


sub dropTable{
	my $table = shift;
	return qq|DROP TABLE IF EXISTS $table|;
}


