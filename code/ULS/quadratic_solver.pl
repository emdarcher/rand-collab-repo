#!/usr/bin/perl
#perl script that solves a quadratic equation
use strict;
use warnings;

print "Quadratic equation solver:
please enter the a,b,&c values of ax^2+bx+c = 0 below:\n";
print "value a: ";
chomp(my $a=<STDIN>);unless($a){$a=0;}
print "value b: ";
chomp(my $b=<STDIN>);$b=0 unless $b;
print "value c: ";
chomp(my $c=<STDIN>);$c=0 unless $c;

#quadratic equation part
my $root = eval {(sqrt(($b**2)-(4*$a*$c)))}
    or die "Trying to take square root of a negative number!
This won't work with the quadratic equation!\n";
my $x0 = ((0-$b)+$root)/(2*$a);
my $x1 = ((0-$b)-$root)/(2*$a);
printf "resulting x0 = %g; x1 = %g;\n", $x0,$x1;
