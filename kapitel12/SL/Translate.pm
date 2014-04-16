package Translate;

use v5.10;

my @gDays = qw|Nil Montag Dienstag Mittwoch Donnerstag Freitag Samstag Sonntag|;
my @gMonths = qw|Nil Januar Februar März April Mai Juni Juli August September 
                Oktober November Dezember|;
my @oDays = qw|Nil ark dip wap sen pop sep kir|;
my @oMonths = qw|Nil diz pod bod rod sip wax lin sen kun fiz nap dep|;

my $myday = 0;
my $mymonth = 0;

sub new{
	my ($self, $day, $month) = @_;
	$myday = $day;
	$mymonth = $month; 
	return $self; 
}

sub getOogaDay{
	my $self = @_;
	return $oDays[$myday];
}

sub getOogaMonth{
	my $self = @_;
        return $oMonths[$mymonth];
}

sub getGermanDay{
	my $self = @_;
        return $gDays[$myday];
}

sub getGermanMonth{
	my $self = @_;
        return $gMonths[$mymonth];
}

sub setDay{
	my ($self, $day) = @_;
	$myday = $day;
}

sub setMonth{
	my ($self, $month) = @_;
        $mymonth = $month;
}

1;
