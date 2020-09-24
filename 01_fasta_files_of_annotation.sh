# Downloaded the .gff file for each species from NCBI, expect Lasioglossum albipes
# which I managed to find on the i5K website but doesn't appear to have gene annoations
# so will just go with mRNA

#---------------------------------------------------------------------------------------

# Making a fasta file of all genes for each annotation set to run through EggNOG
# to get GO terms for each annoation in a uniform way

# To run this script:
# bash script.sh species.gff species.fa

module load bedtools/2.28.0 

GFF=$1
FASTA=$2
BASE=$(basename ${GFF} ".gff")

#replace gene with mRNA for l.albipes
cat ${GFF} | \
awk 'BEGIN{OFS="\t";} $3=="gene" {print $1,$4-1,$5}' | \
sortBed | \
mergeBed -i - > ${BASE}_genes.bed

bedtools getfasta -fi ${FASTA} -bed ${BASE}_genes.bed > ${BASE}_genes.fa

