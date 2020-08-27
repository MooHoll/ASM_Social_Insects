#!/bin/bash

#PBS -N alignment_to_ref
#PBS -l walltime=45:00:00
#PBS -l vmem=20gb
#PBS -m bea
#PBS -M hollie_marshall@hotmail.co.uk
#PBS -l nodes=1:ppn=16

# Run script in the working directory it was submitted in 
cd $PBS_O_WORKDIR 

# Load software needed
module load bowtie2/2.3.5.1
module load samtools/1.9


# Align all samples to the reference
# NOTE: don't have access to rename Alun's genome files and he's on holiday, so just write each command to craic on
#for file in $(ls *1.fq.gz)
#do
#	base=$(basename $file "_trim_1.fq.gz")
#	/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
#	/scratch/monoallelic/shared/ASM_insects/genomes/${base} \
#	-1 ${base}1.fq.gz -2 ${base}2.fq.gz
#done 

/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
/scratch/monoallelic/shared/ASM_insects/genomes/Apis_melifera \
-1 a.mellifera_trim_1.fq.gz -2 a.mellifera_trim_2.fq.gz

/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
/scratch/monoallelic/shared/ASM_insects/genomes/c.calcarata \
-1 c.calcarata_trim_1.fq.gz -2 c.calcarata_trim_2.fq.gz

/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
/scratch/monoallelic/shared/ASM_insects/genomes/Camponotus_floridanus \
-1 c.floridanus_trim_1.fq.gz -2 c.floridanus_trim_2.fq.gz

/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
/scratch/monoallelic/shared/ASM_insects/genomes/Clonal_raider_ant \
-1 o.biroi_trim_1.fq.gz -2 o.biroi_trim_2.fq.gz

/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
/scratch/monoallelic/shared/ASM_insects/genomes/Dinoponera_quadriceps \
-1 d.quadriceps_trim_1.fq.gz -2 d.quadriceps_trim_2.fq.gz

/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
/scratch/monoallelic/shared/ASM_insects/genomes/Dufourea_novaeangliae \
-1 d.novaeangliae_trim_1.fq.gz -2 d.novaeangliae_trim_2.fq.gz

/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
/scratch/monoallelic/shared/ASM_insects/genomes/Harpegnathos_saltator \
-1 h.saltator_trim_1.fq.gz -2 h.saltator_trim_2.fq.gz

/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
/scratch/monoallelic/shared/ASM_insects/genomes/Lasioglossum_albipes \
-1 l.albipes_trim_1.fq.gz -2 l.albipes_trim_2.fq.gz

/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
/scratch/monoallelic/shared/ASM_insects/genomes/Nasonia_vitripennis \
-1 n.vitripennis_trim_1.fq.gz -2 n.vitripennis_trim_2.fq.gz

/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
/scratch/monoallelic/shared/ASM_insects/genomes/Polisties_cadensis \
-1 p.canadensis_trim_1.fq.gz -2 p.canadensis_trim_2.fq.gz

/scratch/monoallelic/shared/ASM_insects/bin/Bismark-0.22.3/bismark --multicore 6 \
/scratch/monoallelic/shared/ASM_insects/genomes/Solenopsis_invicta \
-1 s.invicta_trim_1.fq.gz -2 s.invicta_trim_2.fq.gz
