#!/bin/bash

#PBS -N fastqc
#PBS -l walltime=05:00:00
#PBS -l vmem=20gb
#PBS -m bea
#PBS -M hollie_marshall@hotmail.co.uk
#PBS -l nodes=1:ppn=8

# Change directory to the one the job was submitted in
cd $PBS_O_WORKDIR 

# Load required modules
module load fastqc/0.11.5                                                                

# create the directory where the output files are to be written 
OUTPUT=fastqc_raw                                                                                                                                     
if [ ! -d "$OUTPUT" ]; then                                                                                 
    mkdir -p ${OUTPUT} 
fi

# Run fastqc                                                                                                          
for file in $(ls *.gz)
do
	fastqc -t 8 -o ${OUTPUT} ${file}
done