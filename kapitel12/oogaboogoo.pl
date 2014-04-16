#!/usr/bin/perl -w

use SL::Translate;
use v5.10;

my $trans = Translate->new(3, 1);

print $trans->getOogaDay;
print $trans->getOogaMonth;

print $trans->getGermanDay;
print $trans->getGermanMonth;

$trans->setDay(1);
$trans->setMonth(3);


