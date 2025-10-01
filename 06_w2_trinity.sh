#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --job-name=trinity
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_trinity_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_trinity_%j.e
#SBATCH --partition=pibu_el8

WORKDIR="/data/users/trakic/assembly_annotation_course/RNAdata"
FILE="$WORKDIR/RRS10/ERR11437326.fastq.gz"
MODULE="Trinity/2.15.1-foss-2021a"
OUTDIR="/data/users/trakic/assembly_annotation_course/results/week2/week2_trinity"

module load $MODULE

#commands
Trinity --seqType fq --left $WORKDIR/ERR754081_1.fastq.gz --right $WORKDIR/ERR754081_2.fastq.gz --CPU 16 --max_memory 64G 