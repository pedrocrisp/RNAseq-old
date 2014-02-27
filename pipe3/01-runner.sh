###
#user defined variables:
workingdir=./
script=~/gitrepos/RNAseq/pipe3/01-fastqc.sh
runner=~/gitrepos/RNAseq/pipe3/01-runner.sh
outdir=reads_fastqc
###

function findSamples () {
find reads/ -mindepth 1 -maxdepth 1 -type d  -exec basename {} \;| tr ' ' '\n'
}

cd $workingdir
mkdir ${outdir}
timestamp=$(date +%Y%m%d-%H%M%S)

logdir="./logs/${outdir}.${timestamp}"
mkdir $logdir

cat $script > "$logdir/script.log"
cat $runner > "$logdir/runner.log"
cat $script

findSamples | parallel bash $script {} \>logs/${outdir}.${timestamp}/{}.log 2\>\&1

#To run:
#bash ~/path_to/01-runner.sh
