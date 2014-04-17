#!/usr/bin/perl -wT
use CGI ':standard';
use DBI;


# http://localhost/myDB.cgi

print header;
print start_html("Datenbank Zugriff");

print_menu();
print "<h1> Datenbankzugriff</h1>";
print_prompt();
do_work();
show_spacer();
show_db();
add_vortrag();
add_person();
add_adresse();

print end_html;

sub print_prompt {
	print start_form;
	print "<em>Wie ist dein Name?</em><br>";
	print textfield('name');
	print checkbox('Nicht mein richtiger Name');
	print "<p><em>Where can you find English Sparrows?</em><br>";
	print checkbox_group(
		-name=>'Sparrow locations',
		-values=>[England,France,Spain,Asia,Hoboken],
		-linebreak=>'yes',
		-defaults=>[England,Asia]);
	print "<p><em>How far can they fly?</em><br>",
	radio_group(
		-name=>'how far',
		-values=>['10 ft','1 mile','10 miles','real far'],
		-default=>'1 mile');
	print "<p><em>What's your favorite color?</em> ";
	print popup_menu(-name=>'Color',
		-values=>['black','brown','red','yellow'],
		-default=>'red');
	print hidden('Reference','Monty Python and the Holy Grail');
	print "<p><em>What have you got there?</em><br>";
	print scrolling_list(
		-name=>'possessions',
		-values=>['A Coconut','A Grail','An Icon',
		'A Sword','A Ticket'],
		-size=>5,
		-multiple=>'true');
	print "<p><em>Any parting comments?</em><br>";
	print textarea(-name=>'Comments',
		-rows=>10,
		-columns=>50);
	print "<p>",reset;
	print submit('Action','Shout');
	print submit('Action','Scream');
	print end_form;
}

sub do_work {
	print "<h2>Hier sind die aktuellen Angaben vom Formular</h2>";
	for my $key (param) {
		print "<strong>$key</strong> -> ";
		my @values = param($key);
		print join(", ",@values),"<br>\n";
	}
}

sub show_db{
	print qq|<h1 id="show_db">Datenbank durchsuchen</h1>|;
	print h2("Referate");
	print qq|<p>Das sind die vorhandenen Referate...</p>|;
	show_spacer();
}

sub add_vortrag{
	print qq|<h1 id="add_vortrag">Vortrag (inklusive Sprecher) erfassen</h1>|;
	print start_form(-action => "#add_vortrag");	
	
	print_label("Vortragstitel");
	print textfield(-name=>'vortragstitel',	-size=>25,);
	
	print_label("Vortragsdauer in Minuten");	
	print textfield(-name=>'vortragsdauer', -size=>25,);
	
	print_label("Sprecher");
	print popup_menu(-name=>'sprecher',
                -values=>['Unbekannt', 'Max Muster','Muster Hans'],
                -default=>'Unbekannt', -style=>"width: 225px;");
	
	print_label("");
	print submit('addVortrag', 'Speichern');
	
	if(param('addVortrag')){
		print "<h3>Datensatz wird gespeichert...</h3>"; 

		for (qw|vortragstitel vortragsdauer sprecher|){
                	print_label($_);
        	        print param($_)."<br>";
	        }
	}
	
	print end_form; 
	show_spacer();
}

sub add_person{
	print qq|<h1 id="add_person">Person erfassen</h1>|;
	show_spacer();
}

sub add_adresse{
        print qq|<h1 id="add_adresse">Adresse erfassen</h1>|;
	show_spacer();
}


sub print_menu{
	print qq|
	<div id="menu" style="width: 260px; height: auto; float: right; position: fixed;
			color:#FFFFFF; background-color: gray; padding: 5px; margin-left: 70%;">
		<div style="margin-bottom: 10px;"><a href="#top" style="color: #FFFFFF;">Zur Startseite</a></div>
		<div style="margin-bottom: 10px;"><a href="#show_db" style="color: #FFFFFF;">Datenbank durchsuchen</a></div>
		<div style="margin-bottom: 10px;"><a href="#add_vortrag" style="color: #FFFFFF;">Vortrag ink Sprecher erfassen</a></div>
		<div style="margin-bottom: 10px;"><a href="#add_person" style="color: #FFFFFF;">Person erfassen</a></div>
		<div style="margin-bottom:  0px;"><a href="#add_adresse" style="color: #FFFFFF;">Adresse erfassen</a></div>
	</div> |;
}

sub print_label{
	my $myLabel = shift;
	print qq|<br>
		<div style="width:250px; min-height: 1px; float: left;"> 
			<label style="margin-right: 20px;">$myLabel</label>
		</div>|;	
}

sub show_spacer{
	print qq|<div style="margin-bottom: 600px"></div>|;
}

sub db{
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

	$sth->execute($id) or die sth->errstr;

	my $anzahl = $sth->rows;
	
}

