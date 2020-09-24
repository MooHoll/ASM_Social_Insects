#!/bin/bash

#PBS -N sorting_bams
#PBS -l walltime=08:00:00
#PBS -l vmem=20gb
#PBS -m bea
#PBS -M hollie_marshall@hotmail.co.uk
#PBS -l nodes=1:ppn=16

# Run script in the working directory it was submitted in 
cd $PBS_O_WORKDIR 

# Load software needed (requires python 2)
module load python/gcc/2.7.13

for file in $(ls *bam)
do
    methtuple --sc --gzip -mt CG -m 2 ${file}
done