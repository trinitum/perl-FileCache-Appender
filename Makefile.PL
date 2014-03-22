use 5.008;
use strict;
use warnings;
use ExtUtils::MakeMaker 6.3002;

WriteMakefile(
    NAME                => 'FileCache::Appender',
    AUTHOR              => q{Pavel Shaydo <zwon@cpan.org>},
    VERSION_FROM        => 'lib/FileCache/Appender.pm',
    ABSTRACT_FROM       => 'lib/FileCache/Appender.pm',
    LICENSE             => 'perl',
    PL_FILES            => {},
    PREREQ_PM => {
    },
    BUILD_REQUIRES => {
        'Test::More' => 0.94,
    },
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 6.3002,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'FileCache-Appender-*' },
    META_MERGE => {
        no_index => {
            file => 'README.pod'
        },
        resources => {

            homepage   => 'https://github.com/trinitum/perl-FileCache-Appender',
            bugtracker => 'https://github.com/trinitum/perl-FileCache-Appender/issues',
            repository => 'git://github.com/trinitum/perl-FileCache-Appender',

            license    => 'http://dev.perl.org/licenses/',
        },
    },
);
