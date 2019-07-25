x=eabbb9d9-e626-4fa5-ac58-16222a649b59_gdc_realn_rehead
fastp -q 15 -u 40 -M 0 -n 5 -l 36 -A -G -i ${x}_unmappedone.fastq -o ${x}_unmappedone_clean_1.fastq

seqkit fq2fa ${x}_unmappedone_clean_1.fastq  -o ${x}_unmappedone.fasta
revseq ${x}_unmappedone.fasta ${x}_unmappedone2.fasta -sformat pearson -osf pearson
sed -i 's/.Reversed:/\/2/g' ${x}_unmappedone2.fasta
revseq ${x}_unmappedone2.fasta ${x}_unmappedone1.fasta -sformat pearson -osf pearson
sed -i 's/.Reversed://g' ${x}_unmappedone1.fasta
sed -i 's/\/2/\/1/g' ${x}_unmappedone1.fasta 
