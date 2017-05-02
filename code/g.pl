################################################################################
# This program Modify the fasta filof sequence by adding sequence informations
# from its sequemce information file.
################################################################################


	open (FILEA,"a");
	while ($linea=<FILEA>)
	{
		@A=split(/\t/,$linea);
		$key=$A[0];
		$ind{$key}="| $A[1]";
		
		
	}
	
	
	open (FILEB,"b");

	

	while ($lineb=<FILEB>)
	{
		if ($lineb=~m/>/)
		{
		chomp $lineb;
		@B=split(/\|/,$lineb);
		$B[0]=~'s/>//g' ;
		print ">$ind{$B[0]}\n";
		for $key(keys%ind) 
			{ 
			if ($key=~m/^$B[0]$/)
				{
#				print ">$ind{$key}\n";
				$c=1;last;
				}else {$c=0;}
			}
			
		}
		
		
		elsif ($c)
		{
		 print $lineb;
		}
		
	}
	
			
