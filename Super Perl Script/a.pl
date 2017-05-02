#!/usr/bin/perl -w
use warnings;
open (OUTFILE,">solid0137_20100312_ICC_4958_F3_filtered_9_6purified.fa") || close OUTFILE;

open (INFILE, solid0137_20100312_ICC_4958_F3_filtered_9_6);
my $temp="";
while (<INFILE>)
{print OUTFILE $_;
	if ($_=~m/^\>/) 
	{ $temp=$_;}
	elsif ($_=~m/^[A-Z]/) 
	{ print OUTFILE "$temp"; print OUTFILE "$_";}
}
close OUTFILE;
exit;
