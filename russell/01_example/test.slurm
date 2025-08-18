#!/bin/bash
#SBATCH --job-name=test
#SBATCH --account=publicgrp
#SBATCH --partition=low
#SBATCH --output=jobs/%j_in/test.out
#SBATCH --err=jobs/%j_in/test.err
#SBATCH --cpus-per-task=1
#SBATCH --mem=2.5GB
#SBATCH --time=15:00

source /etc/profile
module load conda
source $(conda info --base)/etc/profile.d/conda.sh
conda activate snakehive

snakemake --profile slurm --forceall
