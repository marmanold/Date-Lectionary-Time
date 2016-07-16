#!perl -T
use v5.22;
use strict;
use warnings;
use Test::More tests=>4;

use Time::Piece;
use Date::Lectionary::Time qw(prevSunday);

can_ok('Date::Lectionary::Time', qw(prevSunday));

my $prevSundayTimePieceObject = &prevSunday(Time::Piece->strptime("2016-01-01", "%Y-%m-%d"));
isa_ok($prevSundayTimePieceObject, 'Time::Piece');

is(
	&prevSunday(Time::Piece->strptime("2016-01-01", "%Y-%m-%d")),
	Time::Piece->strptime("2015-12-27", "%Y-%m-%d"),
	'Sunday previous to 2016-01-01 is 2015-12-27'
);

is(
	&prevSunday(Time::Piece->strptime("2015-12-27", "%Y-%m-%d")),
	Time::Piece->strptime("2015-12-20", "%Y-%m-%d"),
	'Sunday previous to 2015-12-27 is 2015-12-20'
);