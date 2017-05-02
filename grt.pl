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
	my $seq=0; my $id=(); my $len=0; my @bases=(); my $count=0; my $is_seq_start=(); my $rem1=(); my $rem2=(); my  $x=0; my $i=(); my $is_seq_start1=(); my $lenSec=0; my $flagz=(); my $templen=();
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
		    if($numb1[1] != 1)
		    {
				
			if($seq) 
                        {
				
				  $len=length($seq);		#finding length of sequences
				  if($len>=$lenSec) 
				  {
				  #$lenSec=$len;
				  #print O "$len\n";
				   $tempId=$id;  $templen=$len; $tempSeq=$seq;
				 # print O "$id";
				 # print O "          $len\n";
				 # print O "$seq\n";
				  #$bases[$count]=$len; 
		  		  #$count++;
				  $flagz=1;
				  }
				  else
				  {
				   $lenSec=$len; 			                                                 
                                  }
				  
				
			}
			          print O "$tempId";
				  print O "          $templen\n";
				  print O "$tempSeq\n";
			$flagx=1;$id=$_; $is_seq_start=1; $seq="";
			#next if($numb1[0]==$numb1[1]);
	            }
			
		}
			elsif($is_seq_start && $_!~/^$/ && $flagx)
             	    {
                	$seq.=$_;
		    }
	}
	
	if($seq) 
        {
		#print O "$id\t".length($seq)."\n";
		$len=length($seq);
			 
		$bases[$count]=$len;
		print O "$id";
		print O "          $len\n";
		print O "$seq\n";
		  	#$count++;
		
 	}


















				#while($numb1[0]!=$numb1[1])
				#{
				#my	@sequence=$_;
				#}
				#$len=length($seq);		#finding length of sequences
				#if($len >=$x)
				#{
				#	$x=$len;
				#	$tempId=$id;
				#	$tempSeq=$seq;
				#}

			#}
				
			#		print O "$id";
			#	  print O "          $len\n";
			#	  print O "$seq\n";
			#	  $bases[$count]=$len;
				  
				  
				   
		  	#	  $count++;
		   #}
		#	$flagx=1;$id=$_; $is_seq_start=1; $seq="";
	        #}
	 #}
		
	#	elsif($is_seq_start && $_!~/^$/ && $flagx)
         #       {
          #      	$seq.=$_;
	#	}
	#}
		
#if($seq) 
 #       {
		#print O "$id\t".length($seq)."\n";
#		$len=length($seq);
			 
#		$bases[$count]=$len;
#		print O "$id";
#		print O "          $len\n";
#		print O "$seq\n";
#		  	$count++;
		
 	#}
