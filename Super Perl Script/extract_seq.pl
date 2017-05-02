#!/usr/bin/perl -w

use strict;
use warnings;

print "Enter the file name:\n";
my $infile=<STDIN>; chomp($infile);

open(INFILE, $infile) || die $!;
my @data=<INFILE>; close INFILE;

$infile=~s/\.[^\s]+$//;
open(OUTFILE, ">$infile.seq") || die $!; 

$infile=~m/[a-z0-9]+$/i; my $fasta_header=$&;

my $protein_seq=""; my $seq_count=(); my $is_seq_start=0;

foreach(@data) {
	chomp($_);
	if($_=~/^\#\s+protein\s+sequence.+/) {
		$_=~s/^.+\[//; $_=~s/\]//g;
		$protein_seq.=$_;
		$seq_count++;
		$is_seq_start=1;
		print "$seq_count\n";
	}
	elsif($_=~/^\#\s+end gene.+/) {
		print OUTFILE ">$fasta_header"."g".$seq_count."\n";
		print OUTFILE $protein_seq."\n";
		$is_seq_start=0; $protein_seq="";
	}
	elsif($is_seq_start) {
		$_=~s/[\#\s]+//g;
		$protein_seq.=$_;
	}
}

close OUTFILE;
exit;
