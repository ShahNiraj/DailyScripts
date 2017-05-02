	
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
		     
			$midLength=$length_sequence/2;
			
			$reqSeq=substr($seq,$midLength-100,200);
   			
		     print O  "$id\n";
		    
			print O "$reqSeq\n";
		
		}
	   
	     $id=$_; $is_seq_start=1; $seq="";
	  }
	elsif($is_seq_start && $_ !~/^$/)
	{
	    $seq.=$_;
	}
}
	   		$midLength=$length_sequence/2;
		$reqSeq=substr($seq,$midLength-100,200);

		print O "$id\n";
		print O "$reqSeq\n";
    
