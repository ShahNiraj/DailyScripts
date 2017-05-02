open File, $ARGV[0]; # fasta format sequence
print "Left Flank Region::\n";
$left=<stdin>;
print "Right Flank Region::\n";
$right=<stdin>;

open left,">LFR";
open right,">RFR";
	@sequences=<File>;
	
	$onefile=join("",@sequences);
	@splitfile=split(">",$onefile);
	shift(@splitfile);
	
		for($i=0;$i<=$#splitfile;$i++)
		{
			chomp $splitfile[$i];
			@oneseqsplit=split("\n",$splitfile[$i]);
			$idseq=shift(@oneseqsplit);
			chomp $idseq;
			$singleSeq=join("\n",@oneseqsplit);
			$singleSeq =~ s/\n//g;
			$lensingleSeq=length($singleSeq);
			$leftFlankReg=substr($singleSeq,0,$left);
			$rightFlankReg=substr($singleSeq,$lensingleSeq-$right);
			#print "Length is ::: $lensingleSeq\n";
			print left ">$idseq\n$leftFlankReg\n";
			print right ">$idseq\n$rightFlankReg\n";		
		}
	




