#!/usr/bin/perl -w

use strict;
use warnings;

print "Enter the input fasta file:\n";
my $file=<STDIN>; chomp($file);
open(INFILE, $file) || die $!;

print "Analysis options:\na)Extract sequences with defined length above the minimum cutoff\nb)Determine Sequence Length and incorporate it in the output file\nc)Extract sequences with length below and above the maximum and minimum cutoff, respectively\n";
my $option=<STDIN>; chomp($option);

$file=~s/\.[^\s]+$//; 

if($option=~/[aA]+/) {
	my $length=(); my $header=(); my $is_length_ok=(); my $count=(); my %seq=(); my %length=(); my $id=();
	print "\nEnter the cutoff length:\n";
	my $cutoff_length=<STDIN>; chomp($cutoff_length);

	$file=$file."_$cutoff_length".".fna";
	open(OUTFILE, ">$file") || die $!;

	foreach(<INFILE>) {
		chomp($_);
		if($_=~/^>/) {
			$is_length_ok=0;
			$_=~m/length\=[0-9]+/;
			$length=$&; $length=~s/length\=//;
			$header=$_;
			if($length>=$cutoff_length) {
				$_=~m/^\>[^\s]+/; $id=$&; $id=~s/\>//;
				$length{$id}=$length;  $seq{$id}="";
				$is_length_ok=1; 
				$count++; 
			}
		}
		elsif($is_length_ok) {
			$seq{$id}.=$_;
		}
	}
	my @arranged = reverse sort { $length{$a} <=> $length{$b} } (keys(%length));

	foreach(@arranged) {
		print OUTFILE ">$_ length=$length{$_}\n";
		print OUTFILE "$seq{$_}\n";
	}

	close OUTFILE;
	close INFILE;
	print "\n================================================\n";
	print "Total sequences with size greater than $cutoff_length bases: $count";
	print "\n================================================\n";
}
elsif($option=~/[bB]+/) {
	my $is_seq_start=0; my $seq=(); my $id=();

	$file=$file."_length".".fna";
	open(OUTFILE, ">$file") || die $!;

	foreach(<INFILE>) {
		chomp($_);
		if($_=~/^\>.+/) {
			if($seq) {
				print OUTFILE "$id\t".length($seq)."\n"; 
			}
			$id=$_; $is_seq_start=1; $seq="";
		}
		elsif($is_seq_start && $_!~/^$/) {
			$seq.=$_;
		}
	}
	if($seq) {
		print OUTFILE "$id\t".length($seq)."\n"; 
	}
	close OUTFILE;
}
elsif($option=~/[cC]+/) {
	my $length=(); my $header=(); my $is_length_ok=(); my $count=(); my %seq=(); my %length=(); my $id=();
	print "\nEnter the minimum cutoff length:\n";
	my $min_cutoff_length=<STDIN>; chomp($min_cutoff_length);
	print "\nEnter the maximum cutoff length:\n";
	my $max_cutoff_length=<STDIN>; chomp($max_cutoff_length);

	$file=$file."_$min_cutoff_length-$max_cutoff_length".".fna";
	open(OUTFILE, ">$file") || die $!;

	foreach(<INFILE>) {
		chomp($_);
		if($_=~/^>/) {
			$is_length_ok=0;
			$_=~m/length\=[0-9]+/;
			$length=$&; $length=~s/length\=//;
			$header=$_;
			if($length>$min_cutoff_length && $length<$max_cutoff_length) {
				$_=~m/^\>[^\s]+/; $id=$&; $id=~s/\>//;
				$length{$id}=$length;  $seq{$id}="";
				$is_length_ok=1; 
				$count++; 
			}
		}
		elsif($is_length_ok) {
			$seq{$id}.=$_;
		}
	}
	my @arranged = reverse sort { $length{$a} <=> $length{$b} } (keys(%length));

	foreach(@arranged) {
		print OUTFILE ">$_ length=$length{$_}\n";
		print OUTFILE "$seq{$_}\n";
	}

	close OUTFILE;
	close INFILE;
	print "\n================================================\n";
	print "Total sequences between $min_cutoff_length and $max_cutoff_length: $count";
	print "\n================================================\n";
}
exit;
