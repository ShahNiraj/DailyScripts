

print "\n\#\>How many ways you want to split the file in \? \n\#\>enter your response in integer\#\>\t";
$user_response=<>;chomp $user_response;

for ($user_response>0;$user_response>0;$user_response--)
{
  
   print "\n\#\>enter name of input file with path\#\>\t";
   $in=<>;chomp $in;
   open(IN,"$in");

   print "\#\>enter name of output file with path\#\>\t";
   $out=<>;chomp $out;
   open(OUT,">>$out");

   while(<IN>)
   {
	if ($_=~m/>/)
	{	
	$header=$_;
	}
	elsif ($_=~m/\w/)
	{	
		print "\n \#\>enter the required split size of sequence\#\>\t";
		$reqd_seq_length=<>;
		chomp $reqd_seq_length;
	
	  if ($reqd_seq_length>0)
          {
	  print "\n \#\>enter the position from where you want to start sequence retrival\#\>\t";
          $startposition=<>;
	  chomp $startposition;
 
	  for($reqd_seq_length>0,$startposition>=0;$startposition<length ($_);$startposition+=$reqd_seq_length)
		{
		$seq=substr($_,$startposition,$reqd_seq_length);
		print  OUT "$header";
		print  OUT "$seq\n";
		
		}
	   print "\n\#\#\>JOB COMPLETE\<\#\#\n";	
	   }	
	else {print "process over";exit;}
	}	
   }

}



exit;
