#!/usr/bin/env bash

#SBATCH --cpus-per-task=10
#SBATCH --mem=40G
#SBATCH --time=03:00:00
#SBATCH --job-name=jellyfish_histo
#SBATCH --output=/data/users/trakic/assembly_annotation_course/output_err/output_jellyfish_histo_%j.o
#SBATCH --error=/data/users/trakic/assembly_annotation_course/output_err/error_jellyfish_histo_%j.e
#SBATCH --partition=pibu_el8

CONTAINER="/containers/apptainer/jellyfish:2.2.6--0"
WORKDIR="/data/users/trakic/assembly_annotation_course"
FILE="/data/users/trakic/assembly_annotation_course/results/reads.jf"
OUTDIR="/data/users/trakic/assembly_annotation_course/results"

#number of threads changed in slurm parameters to match jellywish setting! was 1, now 10, also specified in jelly command as variable from slurm header instead of jsut a number
apptainer exec \
--bind $WORKDIR \
$CONTAINER \
jellyfish histo -t $SLURM_CPUS_PER_TASK $FILE > ERR11437326.histo
