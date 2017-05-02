open FastFile, $ARGV[0]; # fasta format sequence

	@sequences=<FastFile>;
	$onefile=join("",@sequences);
	@splitfile=split(">",$onefile);
	shift(@splitfile);

		for($i=0;$i<=$#splitfile;$i++)
		{
			chomp $splitfile[$i];
			@oneseqsplit=split("\n",$splitfile[$i]);
			$idseq=shift(@oneseqsplit);
			chomp $idseq;
			$idseq =~ /(^[a-zA-Z0-9_]*)/;
			$readseqid=$1;
#			print "$readseqid\n";
			$singleSeq=join("\n",@oneseqsplit);
			$lensingleSeq = length($singleSeq);
			$singleSeq =~ s/\n//g;


	$a =($singleSeq=~tr/Aa//) ;
	$c =($singleSeq=~tr/Cc//) ;
	$t =($singleSeq=~tr/Tt//);
	$g =($singleSeq=~tr/Gg//);
	
}
	$Total=$a+$t+$c+$g;
	print"total bases in DNA $Total:\n";

	$gc = $g+$c;

	$GCper=($gc*100/$Total);

	print"the percentage of GC: $GCper:\n";
	


