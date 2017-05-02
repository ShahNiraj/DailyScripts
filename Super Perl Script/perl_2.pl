
tie @in, 'Tie::File', "$filein";
tie @temp, 'Tie::File', "perl_2.pl";
tie @header, 'Tie::File',"perl_2.pl";
tie @seq, 'Tie::File', "perl_2.pl";
print  "\n-----------------------------------------------------------------------------------------------------\n";
print "Welcome \n This program is to refine fasta files for discarding headers not followed by sequences\n\n";
print  "-----------------------------------------------------------------------------------------------------\n";
print "enter your response\n";
print  "-----------------------------------------------------------------------------------------------------\n";
print "how many files do you want to refine?\t\n";
print  "-----------------------------------------------------------------------------------------------------\n";
$response=<STDIN>;
if ($response<0 || $response=~m/^[0-9]*/)

  {print  "-----------------------------------------------------------------------------------------------------\n";
    print "enter your file name\t";
    $filein=<STDIN>;
    if ($filein!~m/^\s*$/) {

	chomp ($filein);

	close INFILE;
	for ($i=0,$j=0;$i<$#in; $i++,$j++)
	{
	  if($in[$i]=~m/^\>/) 
	  {	
	    $temp[$j]=$in[$i];	
	    $i++;
	    if ($in[$i]!~m/^\s*$/)
	      {
		$header[$j]=$temp[$j];
		$seq[$j]=$in[$i];
	      }
   
	  }
	}
    print "enter your output file name\t";
    $fileout=<STDIN>;
    chomp ($fileout);
    open (OUTFILE,">>$fileout");
   
  for ($j=0; $j<$#header; $j++)
    {
      print OUTFILE "$header[$j]";
      print OUTFILE "$seq[$j]";
    }
 print "$filein refined, check result file\n";   
  } else {next;}
$response--;

  }
}

else 
{print "invalid response\n";}
  untie @in;
  untie @header;
untie @temp;
untie @seq;
exit; 










