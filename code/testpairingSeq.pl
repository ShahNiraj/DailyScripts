open myfile, $ARGV[0];# fasta file
open idfile, $ARGV[1];# only id file

open (part1,">testCicerFile1.fa");
open (part2,">testCicerFile2.fa");

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
	$Ids[$i]=~ s/>// ;
	#print "$Ids[$i]\n";
	#print "$id";
	@spltId=split("\t", $Ids[$i]);
	for($j=0;$j<=$#seqId;$j++)
	{
		chomp $seqId[$j];
	#	@spltcolm=split("\t",$seqID[$j]);
		
		if($seqId[$j] =~ /\b$spltId[1]\b/)
		
		{
			if($spltId[1] =~ /.*TV$/)
			{
				print part1 "$seqId[$j]\n";
				next;
			}
			elsif($spltId[1] =~ /.*TR$/)
			{
				print part2 "$seqId[$j]\n";
				next;
			}
			#print ">$seqId[$j]\n";
			#print "$seqId[$j]\n";	
			#next;
		}
	}
}
