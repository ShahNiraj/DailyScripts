grep -v ">" <filename>| grep "N" |wc >N_count_of_file;
grep -v ">" <filename>| grep "[ATGC]" |wc >ATGC_count_of_file;


