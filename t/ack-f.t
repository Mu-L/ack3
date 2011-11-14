#!perl

use warnings;
use strict;

use Test::More tests => 2;

use lib 't';
use Util;

prep_environment();

DEFAULT_DIR_EXCLUSIONS: {
    my $regex = 'non';

    my @files = ( qw(
        t/swamp/0
        t/swamp/c-header.h
        t/swamp/c-source.c
        t/swamp/crystallography-weenies.f
        t/swamp/file.bar
        t/swamp/file.foo
        t/swamp/groceries/another_subdir/fruit
        t/swamp/groceries/another_subdir/junk
        t/swamp/groceries/another_subdir/meat
        t/swamp/groceries/fruit
        t/swamp/groceries/junk
        t/swamp/groceries/meat
        t/swamp/groceries/subdir/fruit
        t/swamp/groceries/subdir/junk
        t/swamp/groceries/subdir/meat
        t/swamp/html.htm
        t/swamp/html.html
        t/swamp/incomplete-last-line.txt
        t/swamp/javascript.js
        t/swamp/Makefile
        t/swamp/Makefile.PL
        t/swamp/moose-andy.jpg
        t/swamp/notaMakefile
        t/swamp/notaRakefile
        t/swamp/options.pl
        t/swamp/options.pl.bak
        t/swamp/parrot.pir
        t/swamp/perl-test.t
        t/swamp/perl-without-extension
        t/swamp/perl.cgi
        t/swamp/perl.pl
        t/swamp/perl.pm
        t/swamp/perl.pod
        t/swamp/perl.tar.gz
        t/swamp/pipe-stress-freaks.F
        t/swamp/Rakefile
        t/swamp/sample.rake
        t/swamp/solution8.tar
        ),
        't/swamp/#emacs-workfile.pl#',
        't/swamp/not-an-#emacs-workfile#',
    );

    my @expected = ( qw(
        t/swamp/0
        t/swamp/c-header.h
        t/swamp/c-source.c
        t/swamp/crystallography-weenies.f
        t/swamp/file.bar
        t/swamp/file.foo
        t/swamp/groceries/another_subdir/fruit
        t/swamp/groceries/another_subdir/junk
        t/swamp/groceries/another_subdir/meat
        t/swamp/groceries/fruit
        t/swamp/groceries/junk
        t/swamp/groceries/meat
        t/swamp/groceries/subdir/fruit
        t/swamp/groceries/subdir/junk
        t/swamp/groceries/subdir/meat
        t/swamp/html.htm
        t/swamp/html.html
        t/swamp/incomplete-last-line.txt
        t/swamp/javascript.js
        t/swamp/Makefile
        t/swamp/Makefile.PL
        t/swamp/notaMakefile
        t/swamp/notaRakefile
        t/swamp/options.pl
        t/swamp/options.pl.bak
        t/swamp/parrot.pir
        t/swamp/perl-test.t
        t/swamp/perl-without-extension
        t/swamp/perl.cgi
        t/swamp/perl.pl
        t/swamp/perl.pm
        t/swamp/perl.pod
        t/swamp/perl.tar.gz
        t/swamp/pipe-stress-freaks.F
        t/swamp/Rakefile
        t/swamp/sample.rake
        t/swamp/solution8.tar
        ),
        't/swamp/not-an-#emacs-workfile#',
    );

    my @args = qw( --ackrc=./ackrc -f t/swamp );
    my @results = run_ack( @args );

    sets_match( \@results, \@expected );
}
