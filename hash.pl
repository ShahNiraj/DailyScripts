print "Enter the input fasta file:\n";
	$file=<STDIN>; 
	chomp($file);
	open(INFILE, $file) || die $!;
	#my $option=<STDIN>; chomp($option);
	$file=~s/\.[^\s]+$//; 

	%IdSeq = (); @arrSeq=();
	
	open(Out,">abd.txt") || die $!;
	@rawSequence=<INFILE>;	

	$divideFile=join("",@rawSequence);
	#print Out "$divideFile\n";

	@oneSequence=split(">",$divideFile);
	shift(@oneSequence);
	print "$oneSequence[1]\n\n";

	for($i=0;$i<=$#oneSequence;$i++)
	{
		@uniSequence=();
		@uniSequence=split("\n",$oneSequence[$i]);
		$id=shift(@uniSequence);
		$seq=join("",@uniSequence);
		#print "$uniSequence[1]     \n";
		$arrId[$i]=$id;
		$arrSeq[$i]=$seq;
		$IdSeq{$id} = $seq;
	}
	#for($j=0;$j<=$#arrSeq;$j++)
		#%SortIdSeq=sort(%IdSeq);
		#for $key(sort(keys%SortIdSeq))
		#{
		#	print  Out "Key=$key \nVaule = $SortIdSeq{$key}\n";
    		#}
		foreach $key(sort(keys(%IdSeq)))
		{
			print Out "$key \t$IdSeq{$key}\n";
		}
	
		#print Out "@arrId\n";
