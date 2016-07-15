use v5.22;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Date::Lectionary::Time',
    license             => 'perl',
    dist_author         => q{Michael Wayne Arnold <michael@rnold.info>},
    dist_version_from   => 'lib/Date/Lectionary/Time.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
        'ExtUtils::MakeMaker' => 0, 
        'Devel::Cover' => 0,
        'Test::Pod' => 0,
        'Test::Pod::Coverage' => '>= 1.00',
        'Crypt::OpenPGP' => 0,
        'Module::Signature' => 0,
    },
    test_requires => {
        'Test::More' => 0,
    },
    requires => {
        'Carp' => '>= 1.38', 
        'Try::Tiny' => '>= 0.24', 
        'Time::Piece' => '>= 1.31',
        'Time::Seconds' => '>= 1.31',
        'Exporter::Easy' => '>= 0.18',
    },
    add_to_cleanup     => [ 'Date-Lectionary-Time-*' ],
    create_license => 1, 
    sign => 1, 
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
$builder->dispatch('manifest');
$builder->dispatch('build');
$builder->dispatch('test', verbose => 1);
