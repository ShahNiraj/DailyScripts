	#open MYFILE, $ARGV[0] or die "$! \n";	
        #open (O, ">$ARGV[1]");	
	#open (OO, ">$ARGV[2]");
        #INPUT THE .MISA FILE GENERATED BY THE MISA PROGRAM.
	#THIS PROGRAM WILL FIRST EXTRACT SEQUENCES THAT HAVE SSRs OF SIZE 300 OR LESS IN ONE FILE AND REMAINING SEQUENCES IN ANOTHER FILE  ##
	#THEN IT WILL COLLECT SEQUENCES WHOSE SSRs HAVE ATLEAST 150 BASES UPSTREAM AND DOWNSTREAM. ##
	#OUT OF THESE SEQUENCES IT WILL STORE SEQUENCES WHOSE SSRs ARE NOT FLANKED BY ANOTHER SSRs IN UPTO 150 BASES REGION UPSTREAM AND DOWNSTREAM.

	print "Enter the .misa file generated by MISA Program::\n";
	$file=<stdin>;	
	chomp($file);
	open(MYFILE, $file) or die "$! \n";

	$file=$file."_req_out".".txt";
	open(OUT,">$file") or die "$! \n";
	$file=$file."_other_out".".txt";
	open(OUT1,">$file") or die "$! \n";

        @a=<MYFILE>; 
 	print OUT "ID\tSSR nr.\tSSR type\tSSR\tsize\tstart\tend\n";
	for($i=1;$i<=$#a;$i++)
        {	
 		@sizeOfSSR=split("\t",$a[$i]);
		if($sizeOfSSR[4]<=300)
		{
			$count++;
	    		$requiredSSR[$i]=$a[$i];
			#print OUT "$requiredSSR[$i]";
            	}
	   	else
	   	{
			$count1++;
			$greaterSSR[$i]=$a[$i];
			#print OUT1 "$greaterSSR[$i]";
	   	}
        }
		#print OUT "Total sequences containing such SSR is  $count\n";
		#print OUT1 "Total sequences containing such SSR is  $count1\n";
		#print OUT "Total sequences containing such SSR is  $count1\n";		
		#print  @requiredSSR,"\n";	
	
	for($k=1;$k<=$#requiredSSR;$k++)
	{
		($x[$k],$y,$z,$u,$v,$origin[$k],$end[$k])=split("\t",$requiredSSR[$k]);	
		($ab,$cd,$zy,$lenEnd[$k])=split("_",$x[$k]);
		$endArea[$k]=$lenEnd[$k] +43 -1 - $end[$k];
		
		#print OUT "The end point of ssr is ::$endArea[$k]\n";
		if($origin[$k]>=150 && $endArea[$k]>=150)
		{
			$SSRGrt100[$k]=$requiredSSR[$k];
			#print  OUT "The start pint of ssr :: $origin[$k]\n";
		}
	}
	for($j=1;$j<=$#SSRGrt100;$j++)
		{
	     		($x[$j],$y,$z)=split('\t', $SSRGrt100[$j]);
	  	}
	for($m=1;$m<=$#SSRGrt100;$m++)
	{
		if($x[$m] ne $x[$m+1] && $x[$m] ne $x[$m-1]) 
	    	{
	        	$single_ssr[$m]=$SSRGrt100[$m];
	        	print OUT "$single_ssr[$m]";
		}
		elsif($x[$m] eq $x[$m+1])
		{
			$multiple_ssr_one[$m]=$SSRGrt100[$m];			
			$multiple_ssr_two[$m]=$SSRGrt100[$m+1];
			@multiple_ssr_array_one=split('\t', $SSRGrt100[$m]);
			@multiple_ssr_array_two=split('\t', $SSRGrt100[$m+1]);	

			if($multiple_ssr_array_two[5]-150 >= $multiple_ssr_array_one[6])
			{
				$remember=1;
				print OUT "$multiple_ssr_one[$m]";
			}
			else
			{
				$remember=2;
			}
		}
		else
		{
			if($remember==1)
			{
				print OUT "$SSRGrt100[$m]";
			}
		}
	}
