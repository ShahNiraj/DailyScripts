open(INFILE, $ARGV[0]) || die $!;
@list=<INFILE>;

	for($i=0;$i<=$#list;$i++)
	{
		chomp $list[$i];
		@list1=split("\t",$list[$i]);
		#print "$list1[12]\n";
		if( $list1[12]>1 && $list1[12]<=500)
               	{
                	 $counter01++;
              	}
		elsif( $list1[12]>500 && $list1[12]<=1000)
               	{
                	 $counter02++;
              	}
		elsif( $list1[12]>1000 && $list1[12]<=1500)
               	{
                	 $counter03++;
              	}
		elsif( $list1[12]>1500 && $list1[12]<=2000)
               	{
                	 $counter1++;
              	}
		
		elsif( $list1[12]>2000 && $list1[12]<=2500)
               	{
                	 $counter3++;
              	}
		elsif($list1[12]>2500)
		{
			$counter4++;
		}
	}
		print "smaller than or equal to 500\t$counter01\nBetween 500 and 1000\t$counter02\nBetween 1000 and 1500\t$counter03\nBetween 1500 and 2000\t$counter1\nBetween 2000 and 2500\t$counter3\nGreater than 2500\t$counter4\n";
		
		
