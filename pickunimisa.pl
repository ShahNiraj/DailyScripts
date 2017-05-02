open (IN,"<$ARGV[0]") || die ("\nError: Couldn't open misa.pl results file (*.misa) !\n\n");

my $filename = $ARGV[0];

open (OUT,">$filename.unimisa");

@sequences=<IN>;
#print OUT "$sequences[4]\n";
%hash = ();
	for($j=0;$j<=$#sequences;$j++)
	{
		$hash{$sequences[$j]} = 1;	
		#print OUT "$sequences[4]\n";
		#if($sequences[$j] eq $sequences[$j+1])
		#{
		#	$uni_seq[$j]=$sequences[$j+1];
		#	print "$uni_seq[$j]";
		#}
		
		#elsif($sequences[$j] == $sequences[$j+2])
		#{
			#$uni_twoseq[$j]= $sequences[$j+2];
			#print OUT "$uni_twoseq[$j]";
	#	}
		
			
		#else
		#{
			#$uni_sing_seq[$j]=$sequences[$j]
		#	print OUT "$sequences[$j]";
		#}
	}
foreach $key (keys %hash) {
	print OUT $key;
}
