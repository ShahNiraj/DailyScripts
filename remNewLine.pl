open myfile, $ARGV[0]; #fasta format sequence file
foreach(<myfile>) 
        {
		#chomp($_);
		if($_ =~ /\>.+/)
		{
				
			print "\n$_";
		}
		else
                { 
			chomp($_);
			#$_ =s/\\n//;
			print "$_";
		}
		#print "\n";
	}
