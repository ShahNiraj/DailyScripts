	open(FastaFILE, $ARGV[0]) || die $!;
	open(req,">ReqRes.out");
	open(notreq,">other.out");
	@arrFasta=<FastaFILE>;
	$oneFasta=join("",@arrFasta);
	@divideFasta=split(">",$oneFasta);
	shift(@divideFasta);
	
	#print "$divideFasta[0]\n";
	for($i=0;$i<=$#divideFasta;$i++)
	{
		if($_ =~ /(^.*)>/g)
		{
			$_=~ s/$1//;
			print "$_";
		}
		else
		{
			print "$_";
		}	
	}
	for($i=0;$i<=$#divideFasta;$i++)
	{
		
		if($divideFasta[$i] =~ /PF08711/g)
		{
			print req ">$divideFasta[$i]";	
		}
		else
		{
			print notreq ">$divideFasta[$i]";
		}
	}	
