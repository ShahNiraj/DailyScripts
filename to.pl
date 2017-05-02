

@blastOne=qw(one two three four five six);
@blastTwo=qw(one two four five six ten four four twelve thirteen);
@blastThree=qw(one five four one six seven four four thirteen twelve);

for($i=0;$i<=$#blastOne;$i++)
{
	#print out "$blastOneId[$i]\n";
	@blastOneId=split("\t",$blastOne[$i]);
	#print out "$blastOneId[0]\n";
	for($j=0;$j<=$#blastTwo;$j++)
	{
		@blastTwoId=split("\t",$blastTwo[$j]);
		if($blastOneId[0] eq $blastTwoId[0])
		{
			#print out "$blastOneId[0]\n";
			for($k=0;$k<=$#blastThree;$k++)
			{
				@blastThreeId=split("\t",$blastThree[$k]);
				
				if($blastTwoId[0] eq $blastThreeId[0])
				{
					print 	"$blastThreeId[0]\n";
					last;
				}
				
			}

		}
	}
}
