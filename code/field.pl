open myfile, $ARGV[0];
@file=<myfile>;

for($i=0;$i<=$#file;$i++)
{
	chomp $file[$i];
	@colms=split("\t",$file[$i]);
	$colms[1] =~ /(miR\d*)/g;
	print "$1\n";
}
