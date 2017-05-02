
##################################################################################
####	Perl code to delete hypothetical sequences and then			##
####	select sequences with start and end codon at 5' and 3'end respectively 	## ##################################################################################


if (@ARGV)
{


	open (FILE,"@ARGV") || die "can't open"; 

	while ($line=<FILE>)
	{
		if ($line=~m/^>.+unknown|hypothetical|uncharacterized|Unknown|unnamed/)		{$c=0;}
		elsif($line=~m/^>/) 
		{	
			$c=1; 
		
			if ($seq=~/^ATG.+TAG|TAA|TGA$/i) 
			{
				print "$header";print "$seq";  $seq='';
			}
			$header=$line;
		}
		elsif ($c==1) {  $seq.="$line"; }	
	}

############################ print last sequence #################################
	print "$header";
	
	print "$seq";
	
	close FILE;

undef ($seq);undef ($line);
}


else {	print "\nUSAGE:	perl rmhypo.pl <fasta_file>    >    <outputfile> \n\n" ;}




exit;
