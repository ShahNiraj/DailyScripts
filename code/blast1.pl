open FastFile, $ARGV[0]; # fasta format sequence
open BlastFile, $ARGV[1]; # blast file
#print "Left Flank Region::\n";
#$left=<stdin>;
#print "Right Flank Region::\n";
#$right=<stdin>;

#open left,">LFR";
#open right,">RFR";

	@sequences=<FastFile>;
	@bfile=<BlastFile>;
	$onefile=join("",@sequences);
	@splitfile=split(">",$onefile);
	shift(@splitfile);
	for($j=0;$j<=$bfile;$j++)
	{
		chomp $bfile[$j];
		@splitbFile=split("\t",$bfile[$j]);
		
		for($i=0;$i<=$#splitfile;$i++)
		{
			chomp $splitfile[$i];
			@oneseqsplit=split("\n",$splitfile[$i]);
			$idseq=shift(@oneseqsplit);
			chomp $idseq;
			$singleSeq=join("\n",@oneseqsplit);
			$singleSeq =~ s/\n//g;
			
			if($splitbFile[0] eq $idseq) {
				$bhit=substr($singleSeq,$splitbFile[6],$splitbFile[7]-$splitbFile[6]);
				print ">$idseq\n$bhit\n";
			}
			#$lensingleSeq=length($singleSeq);
			#$leftFlankReg=substr($singleSeq,0,$left);
			#$rightFlankReg=substr($singleSeq,$lensingleSeq-$right);
			#print "Length is ::: $lensingleSeq\n";
		#	print left ">$idseq\n$leftFlankReg\n";
		#	print right ">$idseq\n$rightFlankReg\n";		
		}
	

	}


