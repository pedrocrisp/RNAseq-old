#!/bin/bash
set -e
set -x

sample=$1
sample_dir=reads/$sample
 
fastqs="$(ls $sample_dir/*.fastq.gz)"
 
mkdir reads_scythe/$sample

for fq in $fastqs
do
fqname="$(basename $fq)"
outputFile="reads_scythe/$sample/${fqname%%.*}.noadapt.fq.gz"
scythe \
-p 0.1 \
-a truseq_adapters.fasta \
$fq \
>$outputFile
done

# -p set prior to 0.1 default 0.3
# -a adapter file
# -o output file
#input