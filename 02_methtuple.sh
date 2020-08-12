#$ -V
#$ -cwd
#$ -j y
#$ -o /data/ross/mealybugs/analyses/hollie/logs/methtuple_$JOB_ID.o

set -e

SCRATCH=/scratch/$USER
mkdir -p $SCRATCH
cd $SCRATCH

start=`date +%s`

#---------------------------------------------
# Take deduplicated bams from bismark alignment
## NOTE: needto activate methtuple environment as this runs on python 2.7

echo "copying data in"
rsync /data/ross/mealybugs/analyses/hollie/sex-specific/methylation/05_allele_specific/*bam ./

echo "doing the shiz"
for file in $(ls *bam)
do
    methtuple --sc --gzip -mt CG -m 2 ${file}
done

echo "moving outputs"
mv *gz /data/ross/mealybugs/analyses/hollie/sex-specific/methylation/05_allele_specific

echo "a clean directory is a happy directory"
rm -r $SCRATCH/*

#---------------------------------------------

end=`date +%s`
runtime=$(((end-start)/60))
echo "runtime:"$runtime"mins"
