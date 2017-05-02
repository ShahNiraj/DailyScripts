open MYFILE, $ARGV[0] or die "$! \n";	
open n2,$ARGV[1] or die "$! \n";
open (O, ">$ARGV[2]");

@file1=<MYFILE>;
@file2=<n2>;

	for($i=0;$i<=$#file1;$i++)
	{
		chomp $file1[$i];
		@arrfile1=split("\t",$file1[$i]);
		for($j=0; $j<=$#file2;$j++)                 
		{
			chomp $file2[$j];
			if($file2[$j] =~ /$arrfile[0]/)
			print "$arrfile1\n";
		}
		
	}
