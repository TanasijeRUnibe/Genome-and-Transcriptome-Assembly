#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=128G
#SBATCH --cpus-per-task=32
#SBATCH --job-name=quast_noref
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_quast_noref_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_quast_noref_%j.e
#SBATCH --partition=pibu_el8



WORKDIR="/data/users/trakic/assembly_annotation_course"
FILES="$WORKDIR/for_busco"
CONTAINER="/containers/apptainer/quast_5.2.0.sif"
OUTDIR="/data/users/trakic/assembly_annotation_course/results/week3_quast_noref"
DOWNLOAD_DIR="/data/users/trakic/assembly_annotation_course/"
PACBIO_PATH="/data/users/trakic/assembly_annotation_course/RRS10/ERR11437326.fastq.gz"
#REF_PATH="/data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa"
#--no-sv for when we run without a reference
CALL="apptainer exec --bind $WORKDIR $CONTAINER quast.py "
PARAMS="--eukaryote --large -t $SLURM_CPUS_PER_TASK --pacbio $PACBIO_PATH --no-sv --est-ref-size 135000000"
#apptainer exec --bind $WORKDIR $CONTAINER python quast.py --eukaryote --large -t $SLURM_CPUS_PER_TASK --pacbio $PACBIO_PATH --no-sv -l Flye -o "$OUTDIR/flye" $FILES/flye_assembly.fasta
$CALL $PARAMS -l Flye -o "$OUTDIR/flye" $FILES/flye_assembly.fasta
$CALL $PARAMS -l Ija -o "$OUTDIR/ija" $FILES/ija_assembly.fasta
$CALL $PARAMS -l Hifisam -o "$OUTDIR/hifisam" $FILES/hifisam.asm.bp.p_ctg.fa

