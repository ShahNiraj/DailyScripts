open fastafile, $ARGV[0]; #req.fna/fasta format file only ID
@Sequences=<fastafile>;

for($i=0;$i<=$#Sequences;$i++)
{
	chomp $Sequences[$i];
	@colmSequences=split("_",$Sequences[$i]);
	print "$colmSequences[0]\t$colmSequences[1]_$colmSequences[2]]\n";
}
