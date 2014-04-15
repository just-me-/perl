#!/usr/bin/perl

use strict;
use warnings;
use POSIX qw(setsid);
use Sys::Syslog qw(:standard);
use Getopt::Std;

my $ident      ='Check Diskspace';
my $logopt     ='pid';
my $facility   ='daemon';
my %opts       = ();
my $line	   = '';
my ($proz, $part, $fs);

getopts('mh:i:', \%opts);
$opts{i} = 30 unless $opts{i};
$opts{h} = 80 unless $opts{h};

die "Intervall must be numeric" unless $opts{i} =~ /\d+/;
die "Highwater must be numeric" unless $opts{h} =~ /\d+/;

$opts{i} *= 60; # interval in seconds

chdir '/' or die "Can't chdir to /: $!";

umask 0;

open STDIN, '</dev/null' or die "Can't read /dev/null: $!";
open STDOUT, '>/dev/null' or die "Can't write /dev/null: $!";
open STDERR, '>/dev/null' or die "Can't write /dev/null: $!";

defined(my $pid = fork)   or die "Can't fork: $!";

exit if $pid;
setsid or die "Can't start a new session: $!";

openlog $ident, $logopt, $facility;

syslog("info", "$ident starts");

$SIG{'TERM'} = 'g_exit';


###############################################
# der dreht ewig
for(;;) {
	open ( DF, "df -k |" ) or die ("can't start df");
	while($line = <DF>) {
		if ( $line =~ m!^/dev/! ) {
			($part, undef, undef, undef, $proz, $fs) = 
				split ( /\s+/, $line );
			$proz =~ s/%//;
			if ( $proz >= $opts{h} ) {
				syslog("info", "FS = $fs / Part. = $part / Use = ${proz}%");
				send_mail ( $fs, $part, $proz ) if defined $opts{m};
			}
		}
	}
	close(DF);
    sleep $opts{i};
}

################### End Main ##################

sub g_exit {
    # Aufraeumen
    syslog("info", "$ident got the term signal");
    exit(0);
}

sub send_mail {
	(my $f, my $p, my $pz) = @_;

	use Mail::Sendmail;

	my %Mail = (
		To   => 'rat@cpcm.ch',
		From => 'admin@kl1.digicompci.ch',
		Subject => "$ident: $f on ${pz}%",
		Message => "The partition $p mounted on $f is on ${pz}%"
	);
	sendmail(%Mail) or syslog("info", $Mail::Sendmail::error);
}

