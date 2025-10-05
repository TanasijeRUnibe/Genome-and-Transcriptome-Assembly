#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --job-name=busco_tr
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_busco_tr_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_busco_tr_%j.e
#SBATCH --partition=pibu_el8



WORKDIR="/data/users/trakic/assembly_annotation_course"
FILE="$WORKDIR/trinity_out_dir.Trinity.fasta"
MODULE="BUSCO/5.4.2-foss-2021a"
OUTDIR="/data/users/trakic/assembly_annotation_course/results/week3_busco"
DOWNLOAD_DIR="/data/users/trakic/assembly_annotation_course/"

module load $MODULE

busco -i $FILE -m transcriptome -l brassicales_odb10 -o "busco_transcriptome" --out_path $OUTDIR -c 16 --download_path $DOWNLOAD_DIR

