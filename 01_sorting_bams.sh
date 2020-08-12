#$ -V
#$ -cwd
#$ -j y
#$ -o /data/ross/mealybugs/analyses/hollie/logs/sorting_methtuple_$JOB_ID.o

set -e

SCRATCH=/scratch/$USER
mkdir -p $SCRATCH
cd $SCRATCH

start=`date +%s`

#---------------------------------------------
# Take deduplicated bams from bismark alignment

echo "copying data in"
rsync /data/ross/mealybugs/analyses/hollie/sex-specific/methylation/01_alignment/sorted_final_bams/*bam ./

echo "doing the shiz"
for file in $(ls *bam)
do
    base=$(basename $file "_deduplicated_sorted.bam")
    samtools sort -n -@ 10 -O bam -T _tmp -o ${base}_sorted_methtuple.bam ${file}
done

echo "moving outputs"
mv *sorted_methtuple.bam /data/ross/mealybugs/analyses/hollie/sex-specific/methylation/05_allele_specific

echo "a clean directory is a happy directory"
rm -r $SCRATCH/*

#---------------------------------------------

end=`date +%s`
runtime=$(((end-start)/60))
echo "runtime:"$runtime"mins"
