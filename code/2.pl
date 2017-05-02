open(FastaFILE, $ARGV[0]) || die $!;
open(out,">res.out");

while(<FastaFILE>)
{
	if($_ =~ /(^.*)>/g)
	{
		$_=~ s/$1//;
		print "$_";
	}
	else
	{
		print "$_";
	}
}
