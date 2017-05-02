	
	open MYFILE, $ARGV[0] or die "$! \n";	
        open (O, ">$ARGV[1]");
        foreach(<MYFILE>) 
	{
	   chomp($_);	      
	   if($_ =~ />.+/)
	   {
	 	if($seq)
		{
		     $length_sequence=length($seq);
		     if($length_sequence >800)
		     {
			@splitSeq=split("",$seq);
			until($length_sequence == 800) 
			{
				pop(@splitSeq);
                        }
			$reqSeq=join("",@splitSeq);
			print O  "$id\n";
		    	print O "$reqSeq\n";
		     }
		}
	   
	        $id=$_; $is_seq_start=1; $seq="";
	   }
	   elsif($is_seq_start && $_ !~/^$/)
	   {
	   	 $seq.=$_;
	   }
	}


if($seq)
{
	if($length_sequence >800)
	{
		@splitSeq=split("",$seq);
	        until($length_sequence == 800) 
		{
			pop(@splitSeq);
	        }
		$reqSeq=join("",@splitSeq);
		print O  "$id\n";
		print O "$reqSeq\n";
        }
}   	


	
