#!/bin/bash
set -e
set -x

###
#user defined variables
refdir=~/ps/exp/TAIR10/subread


sample=$1
sample_dir=align/$sample
outdir="featureCounts/${sample}"
mkdir ${outdir}

featureCounts\
    -F SAF\
    -p\
    -C\
    -s 1\
    -a ${refdir}/TAIR10_GFF3_genes.saf\
    -o "$outdir/${sample}.counts"\
    ${sample_dir}/*.bam
