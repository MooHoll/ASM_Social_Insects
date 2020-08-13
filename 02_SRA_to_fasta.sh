#!/bin/bash

#PBS -N sra_to_fasta
#PBS -l walltime=03:00:00
#PBS -l vmem=20gb
#PBS -m bea
#PBS -M hollie_marshall@hotmail.co.uk
#PBS -l nodes=1:ppn=8

# Run script in the working directory it was submitted in 
cd $PBS_O_WORKDIR 

# Load software needed
module load sratoolkit/2.9.6

# Urgh so annoying why doesn't it take a simple loop
fastq-dump --split-files --gzip SRR042617.3.sra
fastq-dump --split-files --gzip SRR042618.3.sra
fastq-dump --split-files --gzip SRR042619.3.sra
fastq-dump --split-files --gzip SRR042620.3.sra
fastq-dump --split-files --gzip SRR2954336.1.sra
fastq-dump --split-files --gzip SRR333750.3.sra
fastq-dump --split-files --gzip SRR333751.3.sra
fastq-dump --split-files --gzip SRR333752.3.sra
fastq-dump --split-files --gzip SRR333753.3.sra
fastq-dump --split-files --gzip SRR333780.3.sra
fastq-dump --split-files --gzip SRR333781.3.sra
fastq-dump --split-files --gzip SRR333782.3.sra
fastq-dump --split-files --gzip SRR333783.3.sra
fastq-dump --split-files --gzip SRR333784.3.sra
fastq-dump --split-files --gzip SRR333785.3.sra
fastq-dump --split-files --gzip SRR5192885.1.sra
fastq-dump --split-files --gzip SRR5192886.1.sra
fastq-dump --split-files --gzip SRR5192887.1.sra
fastq-dump --split-files --gzip SRR5192888.1.sra
fastq-dump --split-files --gzip SRR534568.2.sra
fastq-dump --split-files --gzip SRR647668.2.sra