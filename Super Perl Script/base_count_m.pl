#!/usr/bin/perl -w

use strict;
use warnings;

print("Enter input file (including path):\n");
my $infile=<STDIN>; chomp($infile);

open(INFILE, $infile) || die $!;
my @data=<INFILE>; close INFILE;

my $outfile=$infile; $outfile=~s/\.[^\s]+$/.basecount/;
open(OUTFILE, ">$outfile") || close OUTFILE;

my $is_seq_start=(); my $seq=""; my @temp=(); my $temp=(); my $seq_count=0;
my @ACount=(); my @TCount=(); my @GCount=(); my @CCount=(); my @NCount=(); my @XCount=();

foreach(@data) {
	chomp($_);
	if($_=~/^\>.+/) {
		if($is_seq_start) {
			@temp=split("", $seq);
			$temp=grep { $_=~/[Aa]{1}/i } @temp; $ACount[$seq_count]=$temp;
			$temp=grep { $_=~/[Tt]{1}/i } @temp; $TCount[$seq_count]=$temp;
			$temp=grep { $_=~/[Gg]{1}/i } @temp; $GCount[$seq_count]=$temp;
			$temp=grep { $_=~/[Cc]{1}/i } @temp; $CCount[$seq_count]=$temp;
			$temp=grep { $_=~/[Nn]{1}/i } @temp; $NCount[$seq_count]=$temp;
			$temp=grep { $_=~/[Xx]{1}/i } @temp; $XCount[$seq_count]=$temp;
			$seq_count++;
		}
		$is_seq_start=1; $seq=""; @temp=();
	}
	elsif($is_seq_start && $_!~/^$/) {
		$seq.=$_;
	}
}
@temp=split("", $seq);
$temp=grep { $_=~/[Aa]{1}/i } @temp; $ACount[$seq_count]=$temp;
$temp=grep { $_=~/[Tt]{1}/i } @temp; $TCount[$seq_count]=$temp;
$temp=grep { $_=~/[Gg]{1}/i } @temp; $GCount[$seq_count]=$temp;
$temp=grep { $_=~/[Cc]{1}/i } @temp; $CCount[$seq_count]=$temp;
$temp=grep { $_=~/[Nn]{1}/i } @temp; $NCount[$seq_count]=$temp;
$temp=grep { $_=~/[Xx]{1}/i } @temp; $XCount[$seq_count]=$temp;

my $i=0;
my $ACount=0; my $TCount=0; my $GCount=0; my $CCount=0; my $NCount=0; my $XCount=0;
while($i<=$seq_count) {
	$ACount+=$ACount[$i];
	$TCount+=$TCount[$i];
	$GCount+=$GCount[$i];
	$CCount+=$CCount[$i];
	$NCount+=$NCount[$i];
	$XCount+=$XCount[$i];
	$i++;
}
print OUTFILE "Adenine: $ACount\t";
print OUTFILE "Thiamine: $TCount\t";
print OUTFILE "Guanine: $GCount\t";
print OUTFILE "Cytosine: $CCount\n";
print OUTFILE "N: $NCount\n";
print OUTFILE "X: $XCount\n";
close OUTFILE;
exit;
