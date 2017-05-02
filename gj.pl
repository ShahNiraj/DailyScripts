print "Enter the input fasta file:\n";
	my $file=<STDIN>; 
	chomp($file);
	open(INFILE, $file) || die $!;
	#my $option=<STDIN>; chomp($option);
	$file=~s/\.[^\s]+$//; 
	$count=0;
	$incre=1;
foreach(<INFILE>) 
        {
		chomp($_);
		$count++;
		$ans=$incre*2;
		if($count % $ans ==0) {
			#print "$_\n" ;
			$incre=$incre+2;
		$a=$_ =~ tr/A//;
		$Ade+=$a;
		$t=$_ =~ tr/T//;
		$Thy+=$t;
		$g=$_ =~ tr/G//;
		$Gua+=$g;
		$c=$_ =~ tr/C//;
		$Cyt+=$c;
		$o=$_ =~ tr/N//;
		$oth+=$o;
		$total=$Ade+$Thy+$Gua+$Cyt;
		}
	}
		print "Adenine:$Ade\nThymine:$Thy\nGuanine:$Gua\nCytosine:$Cyt\nOther Base:$oth\nTotal Nucleotides:$total\n";
		
		
