        #!/usr/bin/perl -w
	use strict;
	use warnings;

	print "Enter the input fasta file:\n";
	my $file=<STDIN>; 
	chomp($file);
	open(INFILE, $file) || die $!;
	#my $option=<STDIN>; chomp($option);
	$file=~s/\.[^\s]+$//; 
	#print "$file\n";
	#$file=$file."_length".".fna";
	open(O, ">$file.txt") || die $!;
	my $seq=(); my $id=(); my $len=(); my @bases=(); my $count=0; my $is_seq_start=(); my $rem1=(); my $rem2=(); my $x=0; my $i=(); my $is_seq_start1=();
        my $flagx=0; my $flagy=0; my $tempId=0; my $tempSeq=();
	
	foreach(<INFILE>) 
        {
		chomp($_);
		if($_=~/^\>.+/) 
                { 
		    my @transId=split("_",$_);
		    my @numb1=split("/",$transId[3]);
			#print "$transId[3]\n";
		        #print "$numb1[0]\t$numb1[1]\n";
		    if($numb1[0] == 1 && $numb1[1] == 1)
		    {
			if($seq) 
                        {
				  $len=length($seq);		#finding length of sequences
				  #print O "$len\n";
				  print O "$id";
				  print O "          $len\n";
				  print O "$seq\n";
				  $bases[$count]=$len; 
		  		  $count++;
			}
			$flagx=1;$id=$_; $is_seq_start=1; $seq="";
	            }
		    else
		    {
			#print O "niraj\n";
			my @numb=split("/",$transId[3]);
			#print O "------->>>>> $numb[0]\t$numb[1]\n";
			for($i=0;$i<=$#numb;$i++)
			{
				#print O "value of I is :: $numb[$i]\n";
				if($seq) 
                                {
			#	  $len=length($seq);		#finding length of sequences
				  print O "length is :: $len\n";		
				  if($len >= $x)
				  	{
					   $x=$len;
				           $tempId=$id;
					   $tempSeq=$seq;
					   print O "waht is niraj\n";					
					}
				 # print O "$tempId";
				 # print O "          $x\n";
				 # print O "$tempSeq\n";
				 # $bases[$count]=$x; 
		  	#	  $count++;
			       }
			   $i++;    $id=$_; $is_seq_start1=1; $seq=""; $flagy=1;
	               }
				# $rem2=1;
				 
		    }
			          
                 }
	
		   # $id=$_; $is_seq_start=1; $seq="";
		
	       elsif($is_seq_start && $_!~/^$/ && $flagx)
                {
                	$seq.=$_;
		}
			          
	       elsif($is_seq_start && $_!~/^$/ && $flagy)
                {
                	$seq.=$_;
		}
	}
				  print O "$tempId";
				  print O "          $x\n";
				  print O "$tempSeq\n";

      if($seq) 
        {
		#print O "$id\t".length($seq)."\n";
		$len=length($seq);
			 
		$bases[$count]=$len;
		print O "$id";
		print O "          $len\n";
		print O "$seq\n";
		  	$count++;
		
 	}
print "$count\n";
