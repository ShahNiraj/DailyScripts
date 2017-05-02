grep -A 1 "@HW" Run16_s_1_1_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run1_1.fasta 
grep -A 1 "@HW" Run16_s_1_2_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run1_2.fasta

grep -A 1 "@HW" Run16_s_2_1_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run2_1.fasta &
grep -A 1 "@HW" Run16_s_2_2_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run2_2.fasta &

grep -A 1 "@HW" Run16_s_3_1_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run3_1.fasta &
grep -A 1 "@HW" Run16_s_3_2_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run3_2.fasta &

grep -A 1 "@HW" Run16_s_5_1_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run5_1.fasta &
grep -A 1 "@HW" Run16_s_5_2_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run5_2.fasta &

grep -A 1 "@HW" Run16_s_6_1_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run6_1.fasta &
grep -A 1 "@HW" Run16_s_6_2_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run6_2.fasta &

grep -A 1 "@HW" Run16_s_7_1_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run7_1.fasta &
grep -A 1 "@HW" Run16_s_7_2_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run7_2.fasta &

grep -A 1 "@HW" Run16_s_8_1_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run8_1.fasta &
grep -A 1 "@HW" Run16_s_8_2_sequence.txt_hq_filtered_reads.trimmed_95 |sed -e 's/\-\-//g' -e 's/@HWUSI/>HWUSI/g'| grep -v  '^$' >Run8_2.fasta &
