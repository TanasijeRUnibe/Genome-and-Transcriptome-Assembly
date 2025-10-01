#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=32
#SBATCH --job-name=hifisam
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_hifisam_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_hifisam_%j.e
#SBATCH --partition=pibu_el8

WORKDIR="/data/users/trakic/assembly_annotation_course"
FILE="$WORKDIR/RRS10/ERR11437326.fastq.gz"
CONTAINER="/containers/apptainer/hifiasm_0.25.0.sif"
OUTDIR="/data/users/trakic/assembly_annotation_course/results/week2/week2_hifisam"


apptainer exec \
--bind $WORKDIR \
$CONTAINER \
hifiasm -o $OUTDIR/ERR11437326.asm -t 32 $FILE
#awk '/^S/{print ">"$2;print $3}' FILE.gfa > FILE.fa