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
	#@colmblast2=split("\t",$seqid[$j+1]);
	#$pair1=$seqid[$j];
	#$pair2=$seqid[$j+1];
	#print "$seqid[$j]\n$seqid[$j+1]\n";
	#print "$colmblast1[2]\n";#\t$colmblast2[2]\n";
	
	#print "abc::$#seqid\n";
	for($i=0;$i<=$#splitfile;$i++)
	{
		chomp $splitfile[$i];
		@oneseqsplit=split("\n",$splitfile[$i]);
		$idseq=shift(@oneseqsplit);
		@scaffoldname=split(" ",$idseq);
		chomp ($scaffoldname[0])
		#print "$scaffoldname[0]";
		print "";
		
		chomp $idseq;
		$singleSeq=join("\n",@oneseqsplit);
		#print "$idseq\n$singleSeq\n";
		#exit;	

		if($scaffoldname[0] eq $colmblast1[2])
		{
			print "one\n";
	#		$scaffoldIdOne=$idseq;
	#		$scaffoldSeqOne=$singleSeq;
			#print ">$scaffoldIdOne\n$scaffoldSeqOne\n";
		}
	}
	#$j++;
}
