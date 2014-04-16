#!/usr/bin/perl -wT
use CGI ':standard';

print header;
print start_html("Datenbank Zugriff");
print "<h1> Datenbankzugriff</h1>\n";

print_prompt();
do_work();

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
	print "<hr>\n";
}

sub do_work {
	print "<h2>Hier sind die aktuellen Angaben vom Formular</h2>";
	for my $key (param) {
		print "<strong>$key</strong> -> ";
		my @values = param($key);
		print join(", ",@values),"<br>\n";
	}
}


