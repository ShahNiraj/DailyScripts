#print "Enter the blast file:\n";
$blast=$ARGV[0];
#$blast=<STDIN>; chomp($blast);
open(Fblast, $blast) || die $!;

#print "Enter the term file:\n";
$term=$ARGV[1];
#$term=<STDIN>; chomp($term);
open(Fterm, $term) || die $!;


$blast=$blast.".common";
open(out, ">$blast") || die $!;
$count=0;
@arrGO=<Fterm>;
@arrblast=<Fblast>;
for($i=0;$i<=$#arrGO;$i++)
{
	open (out1,">$arrGO[$i]");
	chomp $arrGO[$i];
	@slim=split("\t",$arrGO[$i]);
	for($j=0;$j<=$#arrblast;$j++)
	{			
		chomp $arrblast[$j];	
		@tab=split("\t",$arrblast[$j]);
		#print out " $arrGO[$i]\tBlast::$tab[3]\n";
		#if($slim[0] eq $tab[1])
		if($tab[1] =~ /$slim[0]/g)
		{
			$count++;
			#print out "$arrGO[$i]\t$count\n";		
			print  out1 "$arrblast[$j]\t$arrGO[$i]\n";
		}
		close (out);
	}
	print out "$arrGO[$i]\t$count\n";
	$count=0;
}
