#!/bin/bash
#BSUB -J STAR_genme_index
#BSUB -o output/STAR_dm646-%J.out
#BSUB -e output/STAR_dm646-%J.err
#BSUB -q normal 
#BSUB -n 4 
#BSUB -R rusage[mem=6000]
#BSUB -u jongminkim@molbio.mgh.harvard.edu 

module add star/2.5.3 

star --runThreadN 4 --runMode genomeGenerate --genomeDir ../../../00_genome/STAR_dm646 --genomeFastaFiles ../../../00_genome/Drosophila_melanogaster.BDGP6.46.dna.toplevel.fa --sjdbGTFfile ../../../00_genome/Drosophila_melanogaster.BDGP6.46.110.chr.gtf  --sjdbOverhang 100

# sjdbOverhang: consider this as maximum possible overlap between mate pairs, so dependent on the sequencing read length. Set as the same default 100.

