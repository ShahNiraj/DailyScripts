open File, $ARGV[0];
#open (out,">$ARGV[1]");
open Ids, $ARGV[1];
open (outreq,">req");
open (outnreq,">nreq");

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
		$bId{$blastId[0]} = 1;
	}
	
	for($i=0;$i<=$#splitfile;$i++)
	{
		chomp $splitfile[$i];
		@oneseqsplit=split("\n",$splitfile[$i]);
		$idseq=shift(@oneseqsplit);
		$singleSeq=join("\n",@oneseqsplit);
		
		$arrId[$i]=$idseq;
		$arrSeq[$i]=$singelSeq;
		#print "$id\t" . length($seq) . "\n";
		
		if($bId{$idseq})
		{
			print outreq ">$idseq\n$singleSeq\n";
		}
		else
		{
			print outnreq ">$idseq\n$singleSeq\n";
		}
	}



exit;
for($k=0;$k<=blastId;$k++)
{
	for $key(keys%IdSeq) 
		{
			
			print "$key\n$IdSeq{$blastId[$k]}\n";
		}
}

exit;
		for($i=0;$i<=$#splitfile;$i++)
		{
			@secondsplit=split("\n",$splitfile[$i]);
			chomp $secondsplit[0]; chomp $secondsplit[1];
			for($j=0;$j<=$#seqid;$j++)
			{
				chomp $seqid[$j];
				@spltID=split("\t",$seqid[$j]);	
				#print ">$secondsplit[0]\n";
				#print "";	
				if($secondsplit[0] =~ $spltID[0])
				{
					#print outreq ">$secondsplit[0]\n$secondsplit[1]\n";	
						
				}
				else
				{
					#print outnreq "$secondsplit[0]\n$secondsplit[1]\n";
					#last if($seqid[$j]);
				}
			}
		}
