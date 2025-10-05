#!/usr/bin/env bash

#SBATCH --time=1-00:00:00
#SBATCH --mem=128G
#SBATCH --cpus-per-task=64
#SBATCH --job-name=quast_ref
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_quast_ref_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_quast_ref_%j.e
#SBATCH --partition=pibu_el8



WORKDIR="/data/users/trakic/assembly_annotation_course"
FILES="$WORKDIR/for_busco"
CONTAINER="/containers/apptainer/quast_5.2.0.sif"
OUTDIR="/data/users/trakic/assembly_annotation_course/results/week3_quast_ref"
DOWNLOAD_DIR="/data/users/trakic/assembly_annotation_course/"
#PACBIO_PATH="/data/users/trakic/assembly_annotation_course/RRS10/ERR11437326.fastq.gz"
REF_PATH="/data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa"
FEAT_PATH="/data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.57.gff3"
#--no-sv for when we run without a reference
#WE NEED TO BIND REFERENCE DIRECTORY AS WELL
CALL="apptainer exec --bind /data/courses --bind $WORKDIR $CONTAINER quast.py "
PARAMS="--eukaryote --large -t $SLURM_CPUS_PER_TASK -r $REF_PATH --features $FEAT_PATH"
#apptainer exec --bind $WORKDIR $CONTAINER python quast.py --eukaryote --large -t $SLURM_CPUS_PER_TASK --pacbio $PACBIO_PATH --no-sv -l Flye -o "$OUTDIR/flye" $FILES/flye_assembly.fasta
$CALL $PARAMS -l Flye -o "$OUTDIR/flye" $FILES/flye_assembly.fasta
$CALL $PARAMS -l Ija -o "$OUTDIR/ija" $FILES/ija_assembly.fasta
$CALL $PARAMS -l Hifisam -o "$OUTDIR/hifisam" $FILES/hifisam.asm.bp.p_ctg.fa

