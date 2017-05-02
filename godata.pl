

	open MYFILE, $ARGV[0] or die "$! \n";
	
	open (O, ">$ARGV[1]");
	 $count=0;
	foreach(<>)
	{
		$count++;
		#print O "$_\n";
		@all=split("\t",$_);
		print O "$all[1]\n";
		#last if ($count==500);
	}
