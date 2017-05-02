open File, $ARGV[0];
#open IDfile, $ARGV[1];
#open (outreq,">req");

#$count=0;
@sequences=<File>;
#@IDs=<IDfile>;

	for($i=0;$i<=$#sequences;$i++)
	{
		chomp $sequences[$i];
		@tab=split("\t",$sequences[$i]);
		@idtab=split("",$tab[1]);
		pop(@idtab);pop(@idtab);
		$id=join("",@idtab);

		for($j=$i+1;$j<=$#sequences;$j++)
		{
			chomp $sequences[$j];
			@tabJ=split("\t",$sequences[$j]);
			@idtabJ=split("",$tabJ[1]);
			pop(@idtabJ);pop(@idtabJ);
  			$idtwo=join("",@idtabJ);
			
			if($id eq $idtwo && $tabJ[3]>=8000 && $tab[3] >=8000)
			{
				#$count++;
				print "$sequences[$i]\n$sequences[$j]\n";
				#print "$count\n";
			}
					
			
			
		}
		#print "$IDs[$i]\t$count\n";
		#$count=0;
	}
	#print "$count\n";
	#if($count >1 && $count <3)
	#		{
				#print "grt\n";
	#			print "$tabJ[4]\n";
	#		}
	#		else
	#		{
	#			print "no\n"
	#		}

