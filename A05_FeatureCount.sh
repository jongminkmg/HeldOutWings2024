# ===============================================
# Featurecount to get transcript counts
# ===============================================

#!/bin/bash
#BSUB -J "job[1-5]" Feature-count 
#BSUB -o output/FCount_1-5-%J-%I.out
#BSUB -e output/FCount_1-5-%J-%I.err
#BSUB -q normal 
#BSUB -n 4 
#BSUB -R rusage[mem=6000]
#BSUB -u jongminkim@molbio.mgh.harvard.edu 

module load subread/1.5.0 

# Unstranded, so - use strand '0'

# Per gene basis counts
featureCounts -T 4 -p -s 0 -t exon -g gene_id -a ../../../00_genome/Drosophila_melanogaster.BDGP6.46.110.chr.gtf -o ../02_sam/ST$LSB_JOBINDEX-FcountS0.txt ../02_sam/ST$LSB_JOBINDEX-q10f2Srt.bam

# Per transcript basis counts
featureCounts -T 4 -p -s 0 -t exon -g transcript_id -a ../../../00_genome/Drosophila_melanogaster.BDGP6.46.110.chr.gtf -o ../02_sam/ST$LSB_JOBINDEX-FTxcountS0.txt ../02_sam/ST$LSB_JOBINDEX-q10f2Srt.bam

# -T: number of threads; -p: paired-end; -s: stranded
