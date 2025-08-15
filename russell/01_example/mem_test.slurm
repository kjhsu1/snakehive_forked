#!/bin/bash
#SBATCH --job-name=mem_test
#SBATCH --account=publicgrp
#SBATCH --partition=low
#SBATCH --output=jobs/%A/mem_test_%a.out
#SBATCH --err=jobs/%A/mem_test_%a.err
#SBATCH --cpus-per-task=1
#SBATCH --mem=4GB
#SBATCH --time=15:00
#SBATCH --array=1-16

module load conda
source $(conda info --base)/etc/profile.d/conda.sh
conda activate snakehive
snakemake --profile slurm --forceall

while sacct -j $SLURM_JOB_ID --format=State --noheader | grep -q RUNNING; do
    sleep 1
done
sacct -j $SLURM_JOB_ID --format=JobID,MaxRSS,MaxVMSize,State --noheader >> mem_out.txt