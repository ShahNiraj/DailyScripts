open orgGen ,$ARGV[0];
open linkF, $ARGV[1];

@org =<orgGen>;
@linkFile=<linkF>;

for($i=0;$i<=$#org;$i++)
{
	chomp $org[$i];
	@split_org=split("\t",$org[$i]);
	for($j=0;$j<=$#linkFile;$j++)
	{
		chomp $linkFile[$j];
		@split_linkFile=split("\t",$linkFile[$j]);
		if($split_org[0] eq $split_linkFile[0])
		{
			print "$org[$i]\t$split_linkFile[1]\n";
		}
	}
}
