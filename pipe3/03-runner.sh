function findSamples () {
find reads_scythe/ -mindepth 1 -maxdepth 1 -type d  -exec basename {} \;| tr ' ' '\n'
}

###
#user defined variables:
workingdir=~/ps/xgames/exp277_mutants/
###

cd $workingdir
mkdir reads_scythe_seqtk

#make sure path is correct
#pete@macpro
findSamples | parallel bash ~/gitrepos/RNAseq/pipe3/03-seqtk.sh {}


#pete@north1ws:
#findSamples | parallel bash ~ws/fastqc.sh {}

#to run call runner from anywhere:
#bash ~/gitrepos/RNAseq/pipe3/02-runner.sh