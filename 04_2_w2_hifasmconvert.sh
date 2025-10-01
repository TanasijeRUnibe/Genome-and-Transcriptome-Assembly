#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=16G
#SBATCH --cpus-per-task=16
#SBATCH --job-name=hifisam_convert
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_hifisam_convert_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_hifisam_convert_%j.e
#SBATCH --partition=pibu_el8

WORKDIR="/data/users/trakic/assembly_annotation_course"
FILE="$WORKDIR/RRS10/ERR11437326.fastq.gz"
CONTAINER="/containers/apptainer/hifiasm_0.25.0.sif"
OUTDIR="/data/users/trakic/assembly_annotation_course/results/week2/week2_hifisam"

awk '/^S/{print ">"$2;print $3}' $OUTDIR/ERR11437326.asm.bp.p_ctg.gfa > $OUTDIR/converted/ERR11437326.asm.bp.p_ctg.fa