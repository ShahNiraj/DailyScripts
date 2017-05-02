open File, $ARGV[0]; # fasta format sequence
#open (out,">$ARGV[1]"); 
open Ids, $ARGV[1];# blast output
open (outreq,">$ARGV[2]");

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
#	print "$seqid[$j]\n";
	@blastId=split("\t",$seqid[$j]);
	#print "$blastID[8]\t$blastID[9]\n";
		if($blastId[0] =~ /(^[\S]*)/)
                {
                        $reqblastId=$1;
                        #$bId{$readseqid} = 1;
                #        $fast{$readseqid}=$singleSeq;
                }

	for($i=0;$i<=$#splitfile;$i++)
	{
		chomp $splitfile[$i];
		@oneseqsplit=split("\n",$splitfile[$i]);
		$idseq=shift(@oneseqsplit);
		chomp $idseq;
		$singleSeq=join("\n",@oneseqsplit);
		$singleSeq =~ s/\n//g;
		if($reqblastId eq $idseq) {
			if($blastId[17] >=$blastId[16])       ####17-18
			{
				$lensubstr=$blastId[17] - $blastId[16]+1;
				
				#print "$blastId[9]\t$blastId[8]\t$lensubstr\t$l\n";		
				#exit;
				$extractedSeq=substr($singleSeq,$blastId[16]-1,$lensubstr);
				$len=length($extractedSeq);
				print outreq ">$idseq\t$lensubstr\n$extractedSeq\n";
			}
			elsif($blastId[17] < $blastId[16])
			{
				$lensubstr=$blastId[17] - $blastId[16]+1;
				$revSingleSeq=reverse($singleSeq);
				$revSingleSeq =~ tr/[A-Za-z]/[A-Za-z]/;
				$extractedSeq=substr($revSingleSeq,$blastId[16]-1,$lensubstr);
				print outreq">$idseq\t$lensubstr\n$extractedSeq\n";
			}
		}
	}
}



