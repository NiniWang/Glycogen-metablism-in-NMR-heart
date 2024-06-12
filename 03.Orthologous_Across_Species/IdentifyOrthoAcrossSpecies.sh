#step1 obtain the longest protein sequences for each of the two species separately.
python ExtractLongestProtein.py -info {file_pathway}/{species}_longest_transcripts_info.csv -raw {file_pathway}/{species}_pep.all.fa.gz -out {file_pathway}/{species}_longest_protein.fa

#step2 blastp
makeblastdb -in {species}_longest_protein.fa -dbtype prot -out {species}_longest_protein_db

blastp -query MM_longest_protein.fa -db NMR_longest_protein_db -out MMtoNMR_protein_blastp.output -evalue 1e-05  -max_target_seqs 1 -outfmt 6

blastp -query NMR_longest_protein.fa -db MM_longest_protein_db -out NMRtoMM_protein_blastp.output -evalue 1e-05  -max_target_seqs 1 -outfmt 6

#step3 merge BLASTP result files and find reciprocal hits
