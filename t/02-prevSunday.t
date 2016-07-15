#!perl -T
use v5.22;
use strict;
use warnings;
use Test::More tests=>2;

use Time::Piece;
use Date::Lectionary::Time qw(prevSunday);

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