my($in)=@ARGV;
open (IN,"$in");
while ($lin=<IN>)
{
 if ($lin=~m/>/)
 {
  chomp $lin; $header=$lin; print "$header \n";
 $lin=<IN>;
  {
   $line=reverse ($lin);
   while($line=~m/[atgcn]/i)
   {  
      if ($line=~m/[atgcATGC]/)
      {
	while ($line=~m/[atcgATCG]$/) {chop $line;}
      }

     

      if ($line=~m/[Nn]$/) 
      {$countN=0;
	while ($line=~m/[Nn]$/) {chop $line;$countN++;}
	$j++;print "batch $j \t $countN N \n";
      }
    }
  }
 }
}

