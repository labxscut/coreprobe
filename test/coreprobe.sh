###!/usr/bin/env bash

#####WARNING!!!!!!!!!!!!!!!!!!!!!!!!!!! MetaMix will be very time consuming!!!!
CoreProbe()
{
  references=${1}
  readfile=${2} 
 
  
  echo "This is time used for $readfile:" >> time
  time_start_bwa=`date +%s`
  #bwa mem -a -S ${references} ${read_directory}/${readfile} > ${readfile}.sam
  bwa mem -P -a -S ${references} ${readfile}.fasta > ${readfile}.sam
  samtools view -bS ${readfile}.sam -o ${readfile}.bam
  samtools sort ${readfile}.bam ${readfile}-sorted
  samtools index ${readfile}-sorted.bam 
  time_end_samtools=`date +%s`
  time_bwa_samtools=$(($time_end_samtools-$time_start_bwa))
  echo "time used for bwa and samtools:\t$time_bwa_samtools" >> time
  
  time_start_pre=`date +%s`
  python bam_process.py ${readfile}.sam ${readfile}-processed
  time_end_pre=`date +%s`
  time_pre=$(($time_end_pre-$time_start_pre))
  echo "time used for bam_process:\t$time_pre" >> time
  
  time_start_CoreProbe=`date +%s`
  ./src/CoreProbe ${readfile}-processed ${readfile}-result 
  time_end_CoreProbe=`date +%s`
  time_CoreProbe=$(($time_end_CoreProbe-$time_start_CoreProbe)) 
  echo "time used for CoreProbe:\t$time_CoreProbe" >> time
  
}
reference=reference.fna.1
readfile=ERR480581
CoreProbe ${reference} ${readfile}
