#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --job-name=lja
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_lja_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_lja_%j.e
#SBATCH --partition=pibu_el8

WORKDIR="/data/users/trakic/assembly_annotation_course"
FILE="$WORKDIR/RRS10/ERR11437326.fastq.gz"
CONTAINER="/containers/apptainer/lja-0.2.sif"
OUTDIR="/data/users/trakic/assembly_annotation_course/results/week2/week2_lja"


apptainer exec \
--bind $WORKDIR \
$CONTAINER \
lja -o $OUTDIR --reads $FILE