package Date::Lectionary::Time;

use v5.22;
use strict;
use warnings;

use Exporter::Easy (
	OK => [qw(nextSunday prevSunday)],
);

use Carp;
use Try::Tiny;
use Time::Piece;
use Time::Seconds;

=head1 NAME

Date::Lectionary::Time

=head1 VERSION

Version 1.20160727

=cut

our $VERSION = '1.20160727';


=head1 SYNOPSIS

Working in the liturgical time of the lectionary means tracking time relative to Sundays.  This is a quick utility to find the next or previous Sunday relative to a given date.

	use Time::Piece;
    use Date::Lectionary::Time qw(nextSunday prevSunday);

    my $christmasDay = Time::Piece->strptime("2015-12-25", "%Y-%m-%d");
    my $sundayAfterChristmas = nextSunday($christmasDay);
    my $sundayBeforeChristmas = prevSunday($christmasDay);

=head1 EXPORT

nextSunday
prevSunday

=head1 SUBROUTINES/METHODS

=head2 nextSunday

For a given Time::Piece date returns a Time::Piece object of the date of the Sunday immediately following the given date.

=cut

sub nextSunday {
	my ($class, @params) = @_;
	my $date = $params[0] // $class;
	my $nextSunday = undef;

	if (!length $date) {
		croak "Method [nextSunday] expects an input argument of type Time::Piece.  The given type could not be determined.";
	}

	if($date->isa('Time::Piece')) {
		try{
			my $daysToAdd = 7-$date->_wday;
			my $secondsToAdd = $daysToAdd * ONE_DAY;
			$nextSunday = $date + $secondsToAdd;
		}
		catch{
			croak "Could not calculate the next Sunday after $date.";
		}
	}
	else {
		croak "Method [nextSunday] expects an input argument of type Time::Piece.";
	}
	
	return $nextSunday;
}

=head2 prevSunday

For a given Time::Piece date returns a Time::Piece object of the date of the Sunday immediately before the given date.

=cut

sub prevSunday {
	my ($class, @params) = @_;
	my $date = $params[0] // $class;
	my $prevSunday = undef;

	if (!length $date) {
		croak "Method [prevSunday] expects an input argument of type Time::Piece.  The given type could not be determined.";
	}

	if($date->isa('Time::Piece')) {
		try{
			my $daysToSubtract = $date->_wday;
			if($daysToSubtract == 0) {$daysToSubtract = 7;}
			my $secondsToSubtract = $daysToSubtract * ONE_DAY;
			$prevSunday = $date - $secondsToSubtract;
		}
		catch {
			carp "Could not calculate the previous Sunday before $date.";
		}
	}
	else {
		croak "Method [prevSunday] expects an input argument of type Time::Piece.";
	}

	return $prevSunday;
}

=head1 AUTHOR

Michael Wayne Arnold, C<< <marmanold at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-date-lectionary-time at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Date-Lectionary-Time>.  I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Date::Lectionary::Time


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Date-Lectionary-Time>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Date-Lectionary-Time>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Date-Lectionary-Time>

=item * Search CPAN

L<http://search.cpan.org/dist/Date-Lectionary-Time/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2016 Michael Wayne Arnold.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See L<http://dev.perl.org/licenses/> for more information.


=cut

1; # End of Date::Lectionary::Time
