################################################################################
# This program Modify the fasta filof sequence by adding sequence informations
# from its sequemce information file.
################################################################################

open (FILEB,"b");
while ($lineb=<FILEB>)
{
	open (FILEA,"a");
	
	if ($lineb=~m/>/)
	{
		chomp $lineb;
		@B=split(/\|/,$lineb);
		
		while ($linea=<FILEA>)
		{
			chomp $linea;

			
			@A=split(/\t/,$linea);


			if($B[0] =~m/^>$A[0]$/ )
			{
				if ($A[1]){print "$lineb | $A[1]\n";}

				else {print "$lineb | unknown_product\n";}


				$c=1; $linea=' '; last; 
			}
			else {$c=0;}
		}

	}
	
	
	elsif($c)
	{
		print "$lineb";
		
	}

	close A;
}

			
close B;
