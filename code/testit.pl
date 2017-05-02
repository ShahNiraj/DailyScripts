#!/usr/bin/perl -w

#use strict;
#use warnings;

	print "Enter the input fasta file:\n";
	my $file=<STDIN>; 
	chomp($file);
	open(INFILE, $file) || die $!;
	#my $option=<STDIN>; chomp($option);
	$file=~s/\.[^\s]+$//; 
	#print "$file\n";
	my @bases=();
	my $len=0;
	my $is_seq_start=0; my $seq=(); my $id=();
	my $count=0;my $bases=0;
        my $counter= 0;	my $counter1=0;
	my $counter2=0;	my $counter3=0;
	my $counter4=0;	my $counter5=0;
	my $counter6=0;	my $counter7=0;
	my $counter8=0;	my $counter9=0;
	my $counter10=0;my $counter11=0;
	my $l=0;
 	my $largest=0;my $total_bases=0;
	my $num=0;
	my $smallest=0;my $avg_contig_size;
	my $ter=0;
	#$file=$file."_length".".fna";
	open(O, ">output12.txt") || die $!;

	foreach(<INFILE>) 
        {
		chomp($_);
		if($_=~/^\>.+/) 
                { 
			if($seq) 
                        {
				$len=length($seq);		#finding length of sequences
				if($len>=100)
				{
				  print O"$id";
				  print O "          $len\n";
				  $bases[$count]=$len; 
		  		  $count++;
				}
     			}
		        $id=$_; $is_seq_start=1; $seq="";
		}
	       elsif($is_seq_start && $_!~/^$/)
                {
                	$seq.=$_;
		}
	}
      if($seq) 
        {
		#print O "$id\t".length($seq)."\n";
		$len=length($seq);
		if($len>=100)
		{
		 
		$bases[$count]=$len;
		print O "$id";
		print O "          $len\n";
		  	$count++;
		}
 	}

	for($l=0;$l<$count;$l++)
          {
	    $total_bases=$total_bases + $bases[$l]; 
            print O "$bases[$l]\n";
          
	     if( $bases[$l]>1 && $bases[$l]<100)
               {
                 $counter++;
               }	
	     if($bases[$l] >=100 && $bases[$l]<=500)
	       {
		  $counter1++;
	       }
	     elsif($bases[$l]>500 && $bases[$l]<=1000)
	       {		
		  $counter2++;
	       }
	     elsif($bases[$l]>1000 && $bases[$l]<=1500)
	       {		
		  $counter3++;
	       }	
	     elsif($bases[$l]>1500 && $bases[$l]<=2000)
	       {		
		  $counter4++;
	       }
	     elsif($bases[$l]>2000 && $bases[$l]<=2500)
	       {		
		  $counter5++;
	       }
	     elsif($bases[$l]>2500 && $bases[$l]<=3000)
	       {		
		  $counter6++;
	       } 	
	     elsif($bases[$l]>3000 && $bases[$l]<=3500)
	       {		
		  $counter7++;
	       }
	     elsif($bases[$l]>3500 && $bases[$l]<=4000)
	       {		
		  $counter8++;
	       }
	     elsif($bases[$l]>4000 && $bases[$l]<=4500)
	       {		
		  $counter9++;
               }
	     elsif($bases[$l]>4500 && $bases[$l]<=5000)
	       {		
		  $counter10++;
	       }	
	    else
	       {		
		  $counter11++;
	       }
          }
	$nfifty=$total_bases/2;
        @bases = sort{$b <=> $a} @bases;

		for($i=0;$i<=$#bases;$i++)
	        {
		   $num=$num+$bases[$i];
		  # print "$bases[$i]\t\t$num\n";
		
		   if($num>=$nfifty)
		     {
			$bn=$bases[$i];
			
			#print "The value is n50: $bn\n";	
               		last;
                     }
	        }
        $smallest = pop (@bases);

        $largest  = shift (@bases);

	$avg_contig_size=$total_bases/$l;
	
	print O "The n50 value is                                :: $bn\n\n";
	print O "The N50 Index value is                          ::",$i+1,"\n\n";
	print O "The total count of contigs is                   :: $l\n\n";
	print O "The total count of bases is                     :: $total_bases \n\n";
	print O "The avg size of contig is                       :: $avg_contig_size\n\n";
	print O "largest length of contig is                     :: $largest\n\n";
  	print O "Smallest length of the contig is                :: $smallest\n\n";
	print O "No. of Contigs less than size 100               :: $counter \n\n";
	print O "No. of Contigs of size between 100 and 500 is   :: $counter1 \n\n";
	print O "No. of Contigs of size between 500 and 1000 is  :: $counter2 \n\n";
 	print O "No. of Contigs of size between 1000 and 1500 is :: $counter3 \n\n";
	print O "No. of Contigs of size between 1500 and 2000 is :: $counter4 \n\n";	
	print O "No. of Contigs of size between 2000 and 2500 is :: $counter5 \n\n";
 	print O "No. of Contigs of size between 2500 and 3000 is :: $counter6 \n\n";
  	print O "No. of Contigs of size between 3000 and 3500 is :: $counter7 \n\n";
	print O "No. of Contigs of size between 3500 and 4000 is :: $counter8 \n\n";
 	print O "No. of Contigs of size between 4000 and 4500 is :: $counter9 \n\n";
  	print O "No. of Contigs of size between 4500 and 5000 is :: $counter10 \n\n";
	print O "No. of Contigs of size greater than 5000 is     :: $counter11 \n\n";
          	
	#close O;



