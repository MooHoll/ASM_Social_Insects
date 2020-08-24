#!/bin/bash

#PBS -N alignment_to_lambda
#PBS -l walltime=04:00:00
#PBS -l vmem=20gb
#PBS -m bea
#PBS -M hollie_marshall@hotmail.co.uk
#PBS -l nodes=1:ppn=16

# Run script in the working directory it was submitted in
cd $PBS_O_WORKDIR

# Load software needed
module load bowtie2/2.3.5.1
module load samtools/1.9

for file in $(ls *1.fq.gz)
do
  	base=$(basename $file "1.fq.gz")
    /scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
    --prefix lambda \
    /scratch/monoallelic/shared/ASM_insects/genomes/lambda_genome \
     -1 ${base}1.fq.gz -2 ${base}2.fq.gz
done