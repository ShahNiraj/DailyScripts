
	open MYFILE, $ARGV[0] or die "$! \n";	
        open (O, ">$ARGV[1]");	
        @a=<MYFILE>; 
 	
	for($i=1;$i<=$#a;$i++)
          {
 		($x[$i],$y,$z)=split("\t",$a[$i]);
          }
	for($m=1;$m<=$#a;$m++)
	  {
           if($x[$m] ne $x[$m+1] && $x[$m] ne $x[$m-1]) 
	    {
	        $single_ssr[$m]=$a[$m];
	        print O "$single_ssr[$m]";
	        #print O "the index value is ::::$m\n";
             #   print O "ssr is there in this region\n";
	        #@single_ssr_array=split('\t',$single_ssr[$m]);
	        #print O "$single_ssr_array[4]\t$single_ssr_array[5]\t$single_ssr_array[6]\t","\n";
	    }
	   elsif($x[$m] eq $x[$m+1])
            {
              #  print O"\n";
		$multiple_ssr_one[$m]=$a[$m];
			
		$multiple_ssr_two[$m]=$a[$m+1];	
 	      #  print O "$multiple_ssr_one[$m]";
	      #	print O "the index value is ::::$m\n";
		#$multiple_ssr_one[$m]=$multiple_ssr[$m+1];
		
		############	 CODE FOR DETECTING FLANKING REGION	 ################

		@multiple_ssr_array_one=split('\t', $a[$m]);
		@multiple_ssr_array_two=split('\t', $a[$m+1]);
			
			

	#	print O "$multiple_ssr_array[5]\t$multiple_ssr_array_one[5]\t","\n";

			if ($multiple_ssr_array_two[5]-200>=$multiple_ssr_array_one[6])
				{
					$remember=1;
					#print O "THIS IS IT::$multiple_ssr_array_one[6]\t::$multiple_ssr_array_two[5]\n";
					print O "$multiple_ssr_one[$m]";
					
					#print O "ssr is there in this region\n";
				}
			else
				{
					$remember=2;
					#print O "No SSr in this region\n";
				}
		#	print O "$multiple_ssr_array[4] \t $multiple_ssr_array[5] \t $multiple_ssr_array[6] \t ","\n";	
	    }
	   else
	    {
		#print O"\n\n";
		#print O"$a[$m]";
		#print O "the index value is ::::$m\n";
		if($remember==1)
		{
		  print O "$a[$m]";
		  #print O"ssr is there in this region\n\n";
		}
		else
		{
		 # print O "No SSR in this region\n\n";
		}
		
            }	
	  }
