	#!/usr/bin/perl -w
	
	
	print "Enter the input fasta file:\n";
	$file=<STDIN>; 
	chomp($file);
	open(INFILE, $file) || die $!;
	#my $option=<STDIN>; chomp($option);
	$file=~s/\.[^\s]+$//; 

	%IdSeq = (); @arrSeq=();   $finalLength=0;
	
	open(Out,">abcd.txt") || die $!;
	@rawSequence=<INFILE>;	

	$divideFile=join("",@rawSequence);
	#print Out "$divideFile\n";

	@oneSequence=split(">",$divideFile);
	shift(@oneSequence);
	#print "$oneSequence[1]\n\n";

	for($i=0;$i<=$#oneSequence;$i++)
	{
		@uniSequence=();
		@uniSequence=split("\n",$oneSequence[$i]);
		$id=shift(@uniSequence);
		$id = ">" . $id;
		$seq=join("",@uniSequence);
		#print "$uniSequence[1]     \n";
		$arrId[$i]=$id;
		$arrSeq[$i]=$seq;
		print "$id\t" . length($seq) . "\n";
		$IdSeq{$id} = $seq;
	}
	
		#foreach $key (sort (keys(%IdSeq)))
		#{
			#print Out "$key \t$IdSeq{$key}\n";
		#}
	
		#print Out "@arrId\n";

	$transIdOne=(); $transSeqOne=();$LentransSeqOne=0; $transIdTwo=(); $transSeqTwo=(); $LentransSeqTwo=0;
	@transcriptLocusOne=(); @transcriptLocusTwo=();$finalLength=0;$finalId=0; $finalSeq=0;
	$longestSeqLen = 0;
	$longestSeqId = "";
	for($k=0;$k<=$#arrId;$k++)
	{
		@spltId=split("_",$arrId[$k]);
		@spltLocus=split("/",$spltId[3]);
		if($spltLocus[0] eq 1 && $spltLocus[1] eq 1)
		{
			print Out "$arrId[$k]\n$arrSeq[$k]\n";		
		}
		else
		{
			if($spltLocus[0] == 1) 
			{
				$longestSeqId = $arrId[$k];
				$longestSeqLen = length($arrSeq[$k]);
			}
			elsif($spltLocus[0] == $spltLocus[1]) 
			{
				$tempLen = length($arrSeq[$k]);
				if($tempLen >= $longestSeqLen) 
				{
					$longestSeqId = $arrId[$k];
					$longestSeqLen = length($arrSeq[$k]);
				}
				print Out "$longestSeqId\t$longestSeqLen\n$IdSeq{$longestSeqId}\n";	
			}
			else 
			{
				$tempLen = length($arrSeq[$k]);
				if($tempLen >= $longestSeqLen)
				{
					$longestSeqId = $arrId[$k];
					$longestSeqLen = length($arrSeq[$k]);
				}
			}
		}	
	}	
	

exit;

			#print Out "$arrId[$k]\n$arrSeq[$k]\n";
			$transIdOne=$arrId[$k];
			#print Out "$transIdOne\n"
			$transSeqOne=$arrSeq[$k];
			$LentransSeqOne=length($arrSeq[$k]);
			#print Out "$LentransSeqOne\n";


			$transIdTwo=$arrId[$k+1];
			$transSeqTwo=$arrSeq[$k+1];
			$LentransSeqTwo=length($arrSeq[$k+1]);


			@transcriptLocusOne=split("_",$transIdOne);
			@transcriptLocusTwo=split("_",$transIdTwo);
			#print Out ">>>>>>>>>>>>>$transcriptLocusTwo[1]\n";

			if($transcriptLocusOne[1] eq $transcriptLocusTwo[1]) 
			{
				if($LentransSeqOne >= $finalLength)
				{
					$finalLength=$LentransSeqOne;
					$finalId=$transIdOne;
					$finalSeq=$transSeqOne;
					#print Out "$arrId[$k]\n$arrSeq[$k]\n";
				}
				#else
				#{
				#	$finalId=$transIdTwo;
				#	$finalSeq=$transSeqTwo;
				#	$finalLength=$LentransSeqTwo;
				#	#print Out "$arrId[$k]\n$arrSeq[$k]\n";
				#}
				print Out "$finalId\n$finalSeq\n$finalLength\n";
			}
			else
			{
				$finalLength=();
				$finalId=();
				$finalSeq=();
			}
			#print Out "$finalId\n$finalSeq\n$finalLength";	













	
