#!/usr/bin/env bash

echo "###the script is an test example of grammy with step to step explanation###"

echo "###the script is an test example of coreprobe with step to step explanation###"
echo "###put raw-seq and grefs under this test directory###"

echo "the name of raw-seq is ERR480581.fasta"
echo "the name of grefs is genomes.fna"

echo "The first step is to generate an index file for the reference file."
bwa index genomes.fna

echo "The second step is to generate the aligned sam file."
#bwa mem -a -S ${references} ${read_directory}/${readfile} > ${readfile}.sam
bwa mem -P -a -S genomes.fna ERR480581.fasta > ERR480581.sam

echo "The third step is to process the sam file"
python $HOME/setup/coreprobe/bam_process.py ERR480581.sam ERR480581-processed

echo "The fourth step is to use CoreProbe to find the result of the comparison."
$HOME/setup/coreprobe/src/CoreProbe ERR480581-processed ERR480581-result

echo "finished"
