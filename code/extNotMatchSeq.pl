open File, $ARGV[0];
open Ids, $ARGV[1];
open (outreq,">$ARGV[2]");
open (outnreq,">$ARGV[3]");
#open (outreq,">req");
#open (outnreq,">nreq");

	@sequences=<File>;
	@seqid=<Ids>;
	
	$onefile=join("",@sequences);
	#print "$onefile\n";

	@splitfile=split(">",$onefile);
	shift(@splitfile);
	#print "$splitfile[0]\n";

	for($j=0;$j<=$#seqid;$j++)
	{
		chomp $seqid[$j];
		@blastId=split("\t",$seqid[$j]);
		$bId{$blastId[1]} = 1;
	}
	
	for($i=0;$i<=$#splitfile;$i++)
	{
		chomp $splitfile[$i];
		@oneseqsplit=split("\n",$splitfile[$i]);
		$idseq=shift(@oneseqsplit);
		$singleSeq=join("\n",@oneseqsplit);

		if($idseq =~ /(^[\S]*)/)
                {
                        $readseqid=$1;
                        #$bId{$readseqid} = 1;
                #        $fast{$readseqid}=$singleSeq;
                }
		
	#	$arrId[$i]=$idseq;
#		$arrSeq[$i]=$singelSeq;
		#print "$id\t" . length($seq) . "\n";
		
		if($bId{$readseqid})
		{
			print outreq ">$idseq\n$singleSeq\n";
		}
		else
		{
			print outnreq ">$idseq\n$singleSeq\n";
		}
	}



