#!/bin/bash
#SBATCH --job-name=test
#SBATCH --account=publicgrp
#SBATCH --partition=low
#SBATCH --output=jobs/test.out
#SBATCH --err=jobs/test.err
#SBATCH --cpus-per-task=1
#SBATCH --mem=10M
#SBATCH --time=15:00

module load conda
mamba activate snakehive

snakemake --profile slurm --forceall
