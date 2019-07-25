x=eabbb9d9-e626-4fa5-ac58-16222a649b59_gdc_realn_rehead

#Single-ended unmapped
samtools view -u -f 4 -F 264 ${x}.bam -o ${x}_unmappedone.bam
samtools view ${x}_unmappedone.bam | cut -f1,10,11 | sed 's/^/@/' | sed 's/\t/\n/' | sed 's/\t/\n+\n/' > ${x}_unmappedone.fastq

#pair_ended unmapped
samtools view -u -f 12 -F 256 ${x}.bam -o ${x}_unmappedtwo.bam
samtools view ${x}_unmappedtwo.bam | cut -f1,10,11 | sed 's/^/@/' | sed 's/\t/\n/' | sed 's/\t/\n+\n/' > ${x}_unmappedtwo.fastq

awk '0 == ((NR+4) % 8)*((NR+5) % 8)*((NR+6) % 8)*((NR+7) %8)' ${x}_unmappedtwo.fastq | awk '{ if(NR%4==1) { print $0 "/1" } else { print $0 } }' > ${x}_unmappedtwo_1.fastq

awk '0 == (NR % 8)*((NR+1) % 8)*((NR+2) % 8)*((NR+3) %8)' ${x}_unmappedtwo.fastq | awk '{ if(NR%4==1) { print $0 "/2" } else { print $0 } }' > ${x}_unmappedtwo_2.fastq
rm ${x}_unmappedone.bam ${x}_unmappedtwo.bam
