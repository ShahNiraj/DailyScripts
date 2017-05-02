open(File,$ARGV[0]);
open(Ids,$ARGV[1]);
@arrFasta=<File>;
@arrIds=<Ids>;

	$oneFasta=join("",@arrFasta);
	@divideFasta=split(">",$oneFasta);
	shift(@divideFasta);	

while(<Ids>)
{
	for($i=0;$i<=$#divideFasta;$i++)
	{
		if($divideFasta[$i] =~ /$_/g)
		{
			print "$divideFasta[$i]\n";
		}
	}
}
	
