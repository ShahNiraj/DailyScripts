
	open(FastaFILE, $ARGV[0]) || die $!;
	open(IdFile,$ARGV[1]) || die $!;

	open(out,">shit.out");

	%hashId=();

	@arrFasta=<FastaFILE>;
	$oneFasta=join("",@arrFasta);
	@divideFasta=split(">",$oneFasta);
	shift(@divideFasta);
	
	print "$divideFasta[0]\n";

	while (<IdFile>) {
		chomp $_;
		@twoF = split("\t",$_);
		
		$hashId{$twoF[0]}=$twoF[1];
	}
	
