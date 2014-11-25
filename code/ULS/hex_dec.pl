#!/usr/bin/perl
#just a quick little script I made to convert from hex to decimal
#to solve a challenge in PicoCTF 2014.
print "Please enter the hexadecimal number on the line below\n";
chomp($in_hex = <STDIN>);
printf "%s in decimal is: %d\n", $in_hex, hex $in_hex;
