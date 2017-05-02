	open(FastaFILE, $ARGV[0]) || die $!;
		
	open(req,">RequiredSeq.txt");
	open(notreq,">Trash.txt");
	open(in,">input");
	
	
	while(<FastaFILE>)
	{
		if($_ =~ /(^.*)>/g)
		{
			$_=~ s/$1//;
			print in "$_";
		}
		else
		{
			print in "$_";
		}	
	}
	close(FastaFILE);
	close(in);
	open(Fasta,"input");
	
	@arrFasta=<Fasta>;
	$oneFasta=join("",@arrFasta);
	print "$oneFasta\n";
	@divideFasta=split(">",$oneFasta);
	
	
	shift(@divideFasta);	
	print "$divideFasta[$#divideFasta]\n";
	print "$#divideFasta\n";
	$count=0;
	$count1=0;
	
	for($i=0;$i<=$#divideFasta;$i++)
	{
		
		if($divideFasta[$i] =~ /PF08711/g)
		{
			$count++;
			print req "$count >$divideFasta[$i]";	
		}
		else
		{
			$count1++;
			print notreq "$count1 >$divideFasta[$i]";
		}
	}	
#unlink(input);
