#!/usr/bin/perl

use strict;
use warnings;
use POSIX qw(setsid);
use Sys::Syslog qw(:standard);

my $ident      ='Perlish Daemon';
my $logopt     ='pid';
my $facility   ='daemon';

chdir '/' or die "Can't chdir to /: $!";

umask 0;

open STDIN, '</dev/null' or die "Can't read /dev/null: $!";
open STDOUT, '>/dev/null' or die "Can't write /dev/null: $!";
open STDERR, '>/dev/null' or die "Can't write /dev/null: $!";

defined(my $pid = fork)   or die "Can't fork: $!";

exit if $pid;
setsid or die "Can't start a new session: $!";

openlog $ident, $logopt, $facility;

syslog("info", "The daemon starts");

$SIG{'TERM'} = 'g_exit';

###############################################
# der dreht ewig
for(;;) {
    sleep 300;
    syslog("info", "daemon hearbeat)");
}

################### End Main ##################

sub g_exit {
    # Aufraeumen
    syslog("info", "The daemon got the term signal");
    exit(0);
}
