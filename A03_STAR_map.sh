# =================================================
# Mapping trimmed RNA-Seq fastq files by using STAR
# =================================================

# Note, with unknown error, STAR does not run as array job in Erisone. Hence single jobs.

#!/bin/bash
#BSUB -J S01_map_STAR
#BSUB -o output/STAR1-%J-%I.out
#BSUB -e output/STAR1-%J-%I.err
#BSUB -q normal 
#BSUB -n 4 
#BSUB -R rusage[mem=6000]
#BSUB -u jongminkim@molbio.mgh.harvard.edu 

module add star/2.5.3

star --runThreadN 4 --genomeDir ../../../00_genome/STAR_dm646 --readFilesIn ../01_trimmed/S1-R1_val_1.fq ../01_trimmed/S1-R2_val_2.fq --outFileNamePrefix ../01_trimmed/S1-
