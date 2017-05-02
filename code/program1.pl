#!/usr/bin/perl

print"please enter the ptt file\n";

$fname=<STDIN>;
chomp $fname;
my %hash_name ;
my %hash_length ;
open(FILE,$fname);
$line=<FILE>;
while($line=<FILE>)
{

chomp $line;
if($line=~/^\s*$/){next;}
@nano=split(/\t/,$line);
$hash_name{$nano[0]}=$nano[7];#print"$nano[0],$nano[4],$nano[7]\n";
$hash_length{$nano[0]}=$nano[4];
}

close(FILE);

print"please enter the sequence.DAT file\n";

$fname1=<STDIN>;
chomp $fname1;
open(OUT,">results_file");
open(FILE1,$fname1);
my $name="";my $len=0;my $seqlen=0;my $seq="";
while($line1=<FILE1>){
chomp $line1;
if($line1=~/^>/){ 	if(exists $hash_name{$name}){ #print"$name pr_len=$hash_length{$name} $hash_name{$name}\n";
							print OUT"$name1gene>$hash_name{$name}\tlen=$seqlen\tpos=$pos\n";
							print "$name1gene>$hash_name{$name}\tlen=$seqlen\tpos=$pos\n";
							print OUT"$seq\n";
							}


			#$signal=0;
			$line1=~/\[Triticum aestivum\]/;
			#$seq=$`;
			$`=~/\d*-\d* /;
			$pos=$&;
		#print"$'302\n";
			$name=$';
			$name1=$`;
			
			$len=0; $seqlen=0;$seq="";   
			next;
		}

			$len = length($line1);
			$seqlen=$seqlen+$len;
			$seq=$seq.$line1;
		

}
if(exists $hash_name{$name}){ #print"$name pr_len=$hash_length{$name} $hash_name{$name}\n";
							print OUT"$name1gene>$hash_name{$name}\tlen=$seqlen\tpos=$pos\n";
							print "$name1gene>$hash_name{$name}\tlen=$seqlen\tpos=$pos\n";
							print OUT"$seq\n";
							}	
close(FILE1);
close(OUT);

print"\n*************************************************************
please collect output as \"results_file\" in the same directory
***************************************************************\n";





















