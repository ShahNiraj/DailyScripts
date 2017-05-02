#! /usr/bin/perl -w
# Reading the file from command line
open (FILE, "$ARGV[0]") or die $!;
open (FILE1, "$ARGV[1]") or die $!;
#ID      SSR nr. SSR type        SSR     size    start   end
#scaffold_1      1       p2      (TA)6   12      2693    2704
#scaffold00549   Rfam    miRNA   126201  126396  157.05  +       1.12E-041       36      MIR159.1        196     1       RF00638 MIR159

$fasta="";
while ($line = <FILE>)
{
        chomp($line);
        if($line =~ /^>((Ca_LG_|scaffold)[0-9]*).*/)
        {
                $hash{"$id"} = $fasta;
                $id = $1;
                $fasta = "";
        }
        else
        {
                $fasta .= $line;
        }
}
$hash{"$id"} = $fasta;
close FILE;
#Ca_LG_1_length=14791696 9       p3      (TGG)5  15      45131   45145
open FILEW,">miRNA.fasta" or die $!;

$i=1;
@we=<FILE1>;
foreach $ed(@we){
if($ed=~/((Ca\_LG\_|scaffold)[0-9]*)\s*(Rfam)\s*miRNA\s*([0-9]*)\s*([0-9]*)\s*[0-9]*\.[0-9]*\s*(\+|\-).*/){
$name="$1";
$type="$3";
#$th="$5";
#$motif1="$6";
#$motif2="$2";
#$iter="$7";
#$size="$8";
$start="$4";
$end="$5";

if(exists($hash{$name})){
$data=$hash{$name};

}
$length1=length($data);

$length4=($end-$start);

#print "$contig_name\n";

$seq=substr($data,$start,$length4);

print FILEW">miRNA\_$i\_$name\_$type\_$start\_$end\n";
print FILEW"$seq\n";
$i++;
#$seq1=substr($data,$end,$length5);
#$rf=reverse($seq1);
#$rf =~ tr/ATGCatgc/TACGtacg/;



}
}


