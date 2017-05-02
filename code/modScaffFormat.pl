open fastafile, $ARGV[0]; #req.fna/fasta format file only ID
open blastfile, $ARGV[1]; # blastoutput

@Sequences=<fastafile>;
@blastHits=<blastfile>;

for($i=0;$i<=$#blastHits;$i++)
{
	chomp $blastHits[$i];
	@colmblastHits=split("\t",$blastHits[$i]);
	#print "$colmblastHits[1]\n";
	for($j=0;$j<=$#Sequences;$j++)
	{
		chomp $Sequences[$j];
		@colmsSequences=split(" ",$Sequences[$j]);
		#print "$colmblastHits[1]\t$colmsSequences[0]\t$colmsSequences[1]\n";
		if($colmsSequences[0] eq $colmblastHits[2])
		{
			print "$colmblastHits[0]\t$colmblastHits[1]\t$colmblastHits[2]\t$colmsSequences[1]\t$colmblastHits[3]\t$colmblastHits[4]\t$colmblastHits[5]\t$colmblastHits[6]\t$colmblastHits[7]\t$colmblastHits[8]\t$colmblastHits[9]\t$colmblastHits[10]\t$colmblastHits[11]\t$colmblastHits[12]\n";
			#exit;
			next;
		}
	}
}

