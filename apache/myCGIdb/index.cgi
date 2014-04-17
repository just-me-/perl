#!/usr/bin/perl -wT

BEGIN{push(@INC,"/var/www/cgi-bin")};
#use lib '/var/www/cgi-bin';
use CGI; # qw|:standard|;
use SL::Subs;

=head
foreach(@INC){
	print $_."\n"; 
}
=cut

# this defines the contents of the fill out forms on each page
@PAGES = ('Personal Information','References','Assets','Review','Confirmation');
%FIELDS = ('Personal Information' => ['Name','Address','Telephone','Fax'],
	   'References'           => ['Personal Reference 1','Personal Reference 2'],
	   'Assets'               => ['Savings Account','Home','Car']
	   );
# accumulate the field names into %ALL_FIELDS;
foreach (values %FIELDS) {
    grep($ALL_FIELDS{$_}++,@$_);
}

# figure out what page we're on and where we're heading.
$current_page = calculate_page(param('page'),param('go'));
$page_name = $PAGES[$current_page];

print_header();
print_form($current_page)         if $FIELDS{$page_name};
print_review($current_page)       if $page_name eq 'Review';
print_confirmation($current_page) if $page_name eq 'Confirmation';
print end_html;

