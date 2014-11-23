#!/usr/bin/env perl
use strict;
use warnings;

my $cards = [
    [ 'Ik ben een student.'    => 'I am a student.' ],
    [ 'Jij bent een student.'  => 'You are a student.' ],
    [ 'Ben jij een student?'   => 'Are you a student?' ],
    [ 'Hij is een student.'    => 'He is a student.' ],
    [ 'Zij is een student.'    => 'She is a student.' ],
    [ 'Wij zijn studenten.'    => 'We are students.' ],
    [ 'Jullie zijn studenten.' => 'You are students.' ],
    [ 'Zij zijn studenten.'    => 'They are students.' ],
];

my $card_num  = int( rand( scalar @$cards ) );
my $card      = $cards->[$card_num];
my $rand_bool = int( rand(2) );
my $from      = $card->[ !!$rand_bool ];
my $to        = $card->[ !$rand_bool ];

print "Translate: \"$from\"\n";
my $line = readline(*STDIN);
print "$to\n";
