#!/bin/bash

#PBS -N trimming
#PBS -l walltime=16:00:00
#PBS -l vmem=20gb
#PBS -m bea
#PBS -M hollie_marshall@hotmail.co.uk
#PBS -l nodes=1:ppn=16
#PBS -q devel

# Run script in the working directory it was submitted in 
cd $PBS_O_WORKDIR

# Load software needed (pigz needed for parallel zipping)
module load trimmomatic/0.36

# Trim 12 bases from reads and adapter contamination from the given .fa file
for file in $(ls ./headcrop_samples/*1.fastq.gz)
do
	base=$(basename $file "1.fastq.gz")
	trimmomatic PE -threads 16 ${base}1.fastq.gz ${base}2.fastq.gz \
	${base}trim_1.fq.gz ${base}trim_unpaired_1.fq.gz ${base}trim_2.fq.gz ${base}trim_unpaired_2.fq.gz \
	ILLUMINACLIP:illumina_adapters.fa:2:30:10 LEADING:30 TRAILING:30 MINLEN:40 HEADCROP:10
done

for file in $(ls *1.fastq.gz)
do
	base=$(basename $file "1.fastq.gz")
	trimmomatic PE -threads 16 ${base}1.fastq.gz ${base}2.fastq.gz \
	${base}trim_1.fq.gz ${base}trim_unpaired_1.fq.gz ${base}trim_2.fq.gz ${base}trim_unpaired_2.fq.gz \
	ILLUMINACLIP:illumina_adapters.fa:2:30:10 LEADING:30 TRAILING:30 MINLEN:40
done

