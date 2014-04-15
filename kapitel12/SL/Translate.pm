package Translate;

my @gDays = qw|Nil Montag Dienstag Mittwoch Donnerstag Freitag Samstag Sonntag|;
my @gMonths = qw|Nil Januar Februar März April Mai Juni Juli August September 
                Oktober November Dezember|;
my @oDays = qw|Nil ark dip wap sen pop sep kir|;
my @oMonths = qw|Nil diz pod bod rod sip wax lin sen kun fiz nap dep|;

my $day = 0;
my $month = 0;

sub new{
	my ($day, $month) = @_;
	my $self = {};
	$self->$day = $day;
	$self->$month = $month; 
	return $self; 
}

sub getOogaDay{
	my $self = @_;
	return $oDays[$self->$day];
}

sub getOogaMonth{
	my $self = @_;
        return $oMonths[$self->$month];
}

sub getGermanDay{
	my $self = @_;
        return $gDays[$self->$day];
}

sub getGermanMonth{
	my $self = @_;
        return $gMonths[$self->$month];
}

sub setDay{
	my ($self, $day) = @_;
	$self->$day = $day;
}

sub setMonth{
	my ($self, $month) = @_;
        $self->$month = $month;
}

1;
