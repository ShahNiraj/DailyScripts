open File, $ARGV[0];
open (OneScaf,">SameScaff.out");
open (Diff,">DiffScaf.out");
open (NotReq,">NotReq.out");

@sequences=<File>;

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
			#print "$tab[2]\t$tabJ[2]\n";			
			if($id eq $idtwo && $tab[2] eq $tabJ[2] && $tabJ[3]>=8000 && $tab[3] >=8000) 
			#if($tab[2] eq $tabJ[2])
			{
				print  OneScaf "$sequences[$i]\n$sequences[$j]\n";
			}		
			elsif($id eq $idtwo && $tab[2] ne $tabJ[2] && $tabJ[3]>=8000 && $tab[3] >=8000)
			{
				print Diff "$sequences[$i]\n$sequences[$j]\n";
			}
			elsif($id eq $idtwo && $tab[2] ne $tabJ[2] && $tabJ[3] < 8000 && $tab[3] < 8000)
			{
				print NotReq "$sequences[$i]\n$sequences[$j]\n";
			}
			
		}
	}
