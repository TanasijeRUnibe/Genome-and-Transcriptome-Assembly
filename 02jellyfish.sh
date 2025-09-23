#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --time=01:00:00
#SBATCH --job-name=jellyfish1
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_fastqc_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_fastqc_%j.e
#SBATCH --partition=pibu_el8

CONTAINER="/containers/apptainer/jellyfish:2.2.6--0"
WORKDIR="/data/users/trakic/assembly_annotation_course"
FILE="/data/users/trakic/assembly_annotation_course/results/ERR11437326_clean.fastq.gz"
OUTDIR="/data/users/trakic/assembly_annotation_course/results"

#the jellyfish was ran on the raw file copied from the course directory, not the cleaned file with fastp, runtime was ~ 15 mins

apptainer exec \
--bind $WORKDIR \
$CONTAINER \
jellyfish count -C -m 21 -s 5G -t 4 <(zcat $FILE) -o $OUTDIR/reads.jf 