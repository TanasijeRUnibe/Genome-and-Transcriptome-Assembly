#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --job-name=flye_assembly
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_flye_assembly_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_flye_assembly_%j.e
#SBATCH --partition=pibu_el8

WORKDIR="/data/users/trakic/assembly_annotation_course"
FILE="$WORKDIR/RRS10/ERR11437326.fastq.gz"
CONTAINER="/containers/apptainer/flye_2.9.5.sif"
OUTDIR="/data/users/trakic/assembly_annotation_course/results/week2/week2_flye"


apptainer exec \
--bind $WORKDIR \
$CONTAINER \
flye --pacbio-hifi $FILE --out-dir $OUTDIR --threads $SLURM_CPUS_PER_TASK