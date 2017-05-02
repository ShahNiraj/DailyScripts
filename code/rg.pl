open File,$ARGV[0];
@arr=<File>;

for($i=0;$i<=$#arr;$i++)
{
	chomp $arr[$i];
	@splt=split("\t",$arr[$i]);
	@seq=split(/\]/,$splt[2]);
	$len=length($seq[0]);
	if($len <64)
	{
		$privseq=$seq[0];
		$privseq=$privseq;
	}
	else
	{
		$privpos=index($seq[0],"[");
		$privseq=substr($seq[0],$privpos-60);
		$privseq=$privseq;
	}
	#print "$privseq\n";

	$lenLast=length($seq[1]);
	$Lastseq=substr($seq[1],0,60);
	$Lastseq="]".$Lastseq;
	print "$splt[0]\t$splt[1]\t$privseq$Lastseq\n";
}
