open File, $ARGV[0]; # fasta format sequence
#open (out,">$ARGV[1]"); 
open Ids, $ARGV[1];# blast output
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
#		print "$seqid[$j]\n";
		@blastId=split("\t",$seqid[$j]);
		#print "$blastID[8]\t$blastID[9]\n";
		
		for($i=0;$i<=$#splitfile;$i++)
		{
			chomp $splitfile[$i];
			@oneseqsplit=split("\n",$splitfile[$i]);
			$idseq=shift(@oneseqsplit);
			chomp $idseq;
			$singleSeq=join("\n",@oneseqsplit);
			if($blastId[8] < $blastId[9])
			{
				$lensubstr=$blastId[9] - $blastId[8];
				
				#print "$blastId[9]\t$blastId[8]\t$lensubstr\t$l\n";		
				#exit;
				$extractedSeq=substr($singleSeq,$blastId[8],$lensubstr);
				$len=length($extractedSeq);
				print ">$seqid[$j]\t$lensubstr\n$extractedSeq\n";
			
			}
			#elsif($blastId[8] > $blastId[9])
			#{
			#	$lensubstr=$blastId[8] - $blastId[9];
			#	$revSingleSeq=reverse($singleSeq);
			#	$revSingleSeq =~ tr/ATGCatgc/TACGTACG/;
			#	$extractedSeq=substr($revSingleSeq,$blastId[9],$lensubstr);
			#	print ">$seqid[$j]\t$lensubstr\n$extractedSeq\n";
				
			#}

					
		}
	
		
	}



