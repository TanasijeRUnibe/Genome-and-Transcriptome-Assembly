#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --time=01:00:00
#SBATCH --job-name=fastqc
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_fastqc_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_fastqc_%j.e
#SBATCH --partition=pibu_el8

#defining directories as variables
CONTAINER="/containers/apptainer/fastp_0.24.1.sif"
WORKDIR="/data/users/trakic/assembly_annotation_course"
FILE="$WORKDIR/RRS10/ERR11437326.fastq.gz"
OUTDIR="/data/users/trakic/assembly_annotation_course/results"

#example command for zipped data from fastqc github:
#fastp -i in.R1.fq.gz -I in.R2.fq.gz -o out.R1.fq.gz -O out.R2.fq.gz
#here we only have 1 file so we only use the lowercase command


apptainer exec \
--bind $WORKDIR \
$CONTAINER \
fastp -i $FILE -o $OUTDIR/ERR11437326_clean.fastq.gz