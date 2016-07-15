#!perl -T
use v5.22;
use strict;
use warnings;
use Test::More tests=>1;

use Time::Piece;
use Date::Lectionary::Time qw(nextSunday);

is(
	&nextSunday(Time::Piece->strptime("2016-01-01", "%Y-%m-%d")),
	Time::Piece->strptime("2016-01-03", "%Y-%m-%d"),
	'Next Sunday after 2016-01-01 is 2016-01-03'
);