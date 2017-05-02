	open MYFILE, $ARGV[0] or die "$! \n";	
        open (O, ">$ARGV[1]");
	print "Input the smaller range of the sequence\n";
	$input_sequence_one=<stdin>;
	print "Input the larger range of the sequence\n";
	$input_sequence_two=<stdin>;      
        foreach(<MYFILE>) 
	{
	   chomp($_);	      
	   if($_ =~ />.+/)
	   {
	 	if($seq)
		{
		     $length_sequence=length($seq);
		     if($length_sequence >= $input_sequence_one && $length_sequence <= $input_sequence_two )
 	             {				
		     print O  "$id";
		     print O 		"$length_sequence\n";
		     print O "$seq\n";
		     }
		}
	   
	     $id=$_; $is_seq_start=1; $seq="";
	  }
	elsif($is_seq_start && $_ !~/^$/)
	{
	    $seq.=$_;
	}
}
	    if($length_sequence >= $input_sequence_one && $length_sequence <= $input_sequence_two )
	    {
		print O "$id";
		print O	"$length_sequence\n";
		print O "$seq\n";
	    }
