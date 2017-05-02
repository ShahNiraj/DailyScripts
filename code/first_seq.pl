#$num=<stdin>;
	$num=1;
	#print "Enter the no.\n";
	open MYFILE, $ARGV[0] or die "$! \n";	
        open (O, ">$ARGV[1]");
	#open (O, ">firstseq.txt");

	$number=$num;
	#$num=5;
       while(@a=<MYFILE>) 
	{
 	for($i=0;$i<=$#a;$i++)
          {
 		($x[$i],$y[$i],$z)=split("\t",$a[$i]);
          }
	
	for($m=0;$m<=$#a;$m++)
	 {
        #   
	 if($x[$m] ne $x[$m+1]) 
	    {
		 print O $a[$m+1];
		 $num=$number;
	    }
	elsif($x[$m] eq $x[$m+1] && $num !=1) 
	    {
		  print O $a[$m-1];
		  $num--;
		  #last if($num==0);
	    }
		
	  }  
	 
        		
        }


  exit;	
	#$num=<stdin>;
	$num=1;
	#print "Enter the no.\n";
	open MYFILE, $ARGV[0] or die "$! \n";	
        open (O, ">$ARGV[1]");
	#open (O, ">firstseq.txt");

	$number=$num;
	#$num=5;
       while(@a=<MYFILE>) 
	{
 	for($i=0;$i<=$#a;$i++)
          {
 		($x[$i],$y[$i],$z)=split("\t",$a[$i]);
          }
	
	for($m=0;$m<=$#a;$m++)
	 {
        #   
	 if($y[$m] ne $y[$m+1]) 
	    {
		 print O $a[$m+1];
		 $num=$number;
	    }
	elsif($y[$m] eq $y[$m+1] && $num !=1) 
	    {
		  print O $a[$m-1];
		  $num--;
		  #last if($num==0);
	    }
		
	  }  
	 
        		
        }


			
