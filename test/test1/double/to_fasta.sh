#!/bin/bash

for x in `cat dataname.txt`
do
seqkit fq2fa ${x}.fastq -o ${x}.fasta
done
