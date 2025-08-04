#!/bin/bash
#SBATCH --job-name=test
#SBATCH --account=publicgrp
#SBATCH --partition=low
#SBATCH --output=jobs/test.out
#SBATCH --err=jobs/test.err

module load conda
mamba activate snakehive

snakemake --profile slurm --forceall
