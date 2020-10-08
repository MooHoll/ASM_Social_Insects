#!/bin/bash

#PBS -N methtuple_job
#PBS -l walltime=56:00:00
#PBS -l vmem=40gb
#PBS -m bea
#PBS -M aj258@le.ac.uk
#PBS -l nodes=1:ppn=24

# Run script in the working directory it was submitted in 
cd $PBS_O_WORKDIR 

# activate python enviroment
source activate /home/a/aj258/miniconda3/envs/METHTUPLE

for file in $(ls *bam)

do

    methtuple --sc --gzip --mt CG -m 2 ${file}

done
