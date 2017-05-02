open File,$ARGV[0];
@arr=<File>;
open(o1,">1.out");
open(o2,">2.out");
$onef=join("",@arr);
@splitfile=split(">",$onef);
shift(@splitfile);
for($i=0;$i<=$#splitfile;$i++)
{
	 if($i>=0 && $i<100) {
		print o1 ">"."$splitfile[$i]";
	 }
	elsif($i>=100 && $i<200) {
		print o2 ">"."$splitfile[$i]";
	}  
}
