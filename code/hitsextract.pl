open File, $ARGV[0];
#open (out,">$ARGV[1]");
open Ids, $ARGV[1];
#open (outreq,">req");
#open (outnreq,">nreq");

	@sequences=<File>;
	@seqid=<Ids>;
	
	$onefile=join("",@sequences);
	#print "$onefile\n";

	@splitfile=split(">",$onefile);
	shift(@splitfile);
	#print "$splitfile[0]\n";
	
	for($i=0;$i<=$#splitfile;$i++)
	{
		chomp $splitfile[$i];
		@oneseqsplit=split("\n",$splitfile[$i]);
		$idseq=shift(@oneseqsplit);
		chomp $idseq;
		$singleSeq=join("\n",@oneseqsplit);
		
		$arrId[$i]=$idseq;
		$arrSeq[$i]=$singelSeq;
		$fast{$idseq}=$singleSeq;
	}

for($j=0;$j<=$#seqid;$j++)
	{
		chomp $seqid[$j];
		#print "$seqid[$j]\n";
		#@blastId=split("\t",$seqid[$j]);
		#$bId{$blastId[0]} = 1;
		$bId{$seqid[$j]}=1;

#		for $keys(keys %fast)
#		{
#			print "$seqid[$j]\n$fast{$seqid[$j]}\n"
#		}
	#	if($fast{$seqid[$j]})
	#	{
			print "$seqid[$j]\n$fast{$seqid[$j]}\n"
	#	}
		
	}



