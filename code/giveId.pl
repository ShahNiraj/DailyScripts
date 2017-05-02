open FastFile, $ARGV[0]; # fasta format sequence

#open (lout,">$ARGV[2]");

@sequence=<FastFile>;
$count=0;
for($i=0;$i<=$#sequence;$i++)
{
	chomp $sequence[$i];
	if($sequence[$i] =~ /^>.*/)
	{
		$count++;
		print ">nod_$count\n";
	}
	else
	{
		print "$sequence[$i]\n";
	}
}

