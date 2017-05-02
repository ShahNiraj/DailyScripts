open File, $ARGV[0]; # Fasta format sequence file
@seqid=<File>;
open FastaSeq,$ARGV[1]; # Blast output
@fastaSeq=<FastaSeq>;

	$onefile=join("",@fastaSeq);
	@splitfile=split(">",$onefile);
	shift(@splitfile);
	#print "$splitfile[0]\n";

for($j=0;$j<=$#seqid;$j++)
{
	
	chomp $seqid[$i];
	@colmblast1=split("\t",$seqid[$j]);
	chomp ($colmblast1[2]);

	for($i=0;$i<=$#splitfile;$i++)
	{
		chomp $splitfile[$i];
		@oneseqsplit=split("\n",$splitfile[$i]);
		$idseq=shift(@oneseqsplit);
		chomp $idseq;
		$singleSeq=join("\n",@oneseqsplit);

		@scaffoldname=split(" ",$idseq);
		chomp ($scaffoldname[0]);
		print "$scaffoldname[0]\n";


		if($scaffoldname[0] eq $colmblast1[2])
		{
	#		print "one\n";
	#		$scaffoldIdOne=$idseq;
	#		$scaffoldSeqOne=$singleSeq;
			#print ">$scaffoldIdOne\n$scaffoldSeqOne\n";
		}
	}
	#$j++;
}
