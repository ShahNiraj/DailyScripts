use Bio::DB::GenBank;
use Bio::SeqIO;

open(I,"<$ARGV[0]");
$seqio_obj = Bio::SeqIO->new(-file => ">$ARGV[1]", -format => "fasta" );

while(<I>) {
	chomp;
	next if(/^\#/);
	$db_obj = Bio::DB::GenBank->new;
	$seq_obj = $db_obj->get_Seq_by_acc($_); 
	$seqio_obj->write_seq($seq_obj);
}
