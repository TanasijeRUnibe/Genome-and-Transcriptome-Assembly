#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=128G
#SBATCH --cpus-per-task=32
#SBATCH --job-name=busco
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_busco_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_busco_%j.e
#SBATCH --partition=pibu_el8



WORKDIR="/data/users/trakic/assembly_annotation_course"
FILES="$WORKDIR/for_busco"
MODULE="BUSCO/5.4.2-foss-2021a"
OUTDIR="/data/users/trakic/assembly_annotation_course/results/week3_busco"
DOWNLOAD_DIR="/data/users/trakic/assembly_annotation_course/"

module load $MODULE

busco -i $FILES -m genome -l brassicales_odb10 -o "busco_genome" --out_path $OUTDIR -c 32 --download_path $DOWNLOAD_DIR

#only ran on one file, running separate scripts for two others...

