open myfile, $ARGV[0];
open idfile, $ARGV[1];

@comp=<myfile>;
$onefile=join("",@comp);
	#print "$onefile\n";
@seqId=split(">",$onefile);
shift(@seqId);
	#print "@seqId\n";
@Ids=<idfile>;
for($i=0;$i<=$#Ids;$i++)
{
	chomp $Ids[$i];
print "$Ids[$i]\n";
	#@spltId=split("\t", $Ids[$i]);
	for($j=0;$j<=$#seqId;$j++)
	{
		chomp $seqId[$j];
		#print "$seqId[$j]\n";
		if($seqId[$j] =~ /$Ids[$i]/g)
		{
			#print "$seqId[$j]\n";	
		}
	}
}
