$sub print_form {
    my $current_page = shift;
    print "Ausf&uuml;llen oder Wahl.",
       start_form,
       hr;
	if ($current_page > 0) {
		draw_form(@{$FIELDS{$page_name}});
	} else {
		draw_startform(@PAGES);
	}
    print hr;
    print submit(-name=>'go',-value=>'Previous Page') 
	if $current_page > 0;
    print submit(-name=>'go',-value=>'Next Page'),
       hidden(-name=>'page',-value=>$current_page,-override=>1),
       end_form;
}



...



# CREATE THE STARTFORM
sub draw_startform {
    my @pages = @_;
	shift(@pages); # Startseite eliminieren
    my %fields;
    # my (@hidden_fields) = grep(!$fields{$_},keys %ALL_FIELDS);
	my $myself = self_url;
	foreach my $page (@pages) {
		print(
			#TR(th({-align=>'LEFT'},$page)),
			a({-href=>"${myself}#$page"},"$page"),
			br,
		);
	}

    # foreach (@hidden_fields) {
    #     print hidden(-name=>$_);
    # }
}
