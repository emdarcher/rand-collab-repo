#!/usr/bin/perl
#perl script that solves a quadratic equation
use strict;
use warnings;

print "Quadratic equation solver:\nplease enter the a,b,&c values of ax^2+bx+c = 0\nvalue a: ";
chomp(my $a=<STDIN>);
print "value b: ";
chomp(my $b=<STDIN>);
print "value c: ";
chomp(my $c=<STDIN>);

#quadratic equation part
my $x0 = ((0-$b)+sqrt(($b**2)-(4*$a*$c)))/(2*$a);
my $x1 = ((0-$b)-sqrt(($b**2)-(4*$a*$c)))/(2*$a);
printf "resulting x0 = %d; x1 = %d;", $x0,$x1;
