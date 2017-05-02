open(IN,"first1") || die "cant open file";
@data = <IN>;
close(IN);
open(ID,"t12.txt") || die "cant open file";
@id =<ID>;
close(ID);
open(OUT,">tom12.fa");

my $id_seq_found=();

foreach $id(@id)
{
	chomp($id); $id=~s/\s+//g; $id=~s/\>//g;
	foreach(@data)
	{
		chomp($_);
		if($_=~/^\>.+/) {
			$id_seq_found=0;
			if($_=~/.+$id.+/) {
				$id_seq_found=1; print OUT "$_\n";
			}
		}
		elsif($id_seq_found) {
			print OUT "$_\n";
		}
	}
}

close OUT;
exit;
			
