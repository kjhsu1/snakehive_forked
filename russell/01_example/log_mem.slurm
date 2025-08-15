#!/bin/bash
#SBATCH --job-name=mem_log
#SBATCH --account=publicgrp
#SBATCH --partition=low
#SBATCH --output=jobs/%A/mem_log.out
#SBATCH --err=jobs/%A/mem_log.err
#SBATCH --cpus-per-task=1
#SBATCH --mem=500MB
#SBATCH --time=15:00

sacct -j "$1" --format=JobID,MaxRSS,State --noheader > mem_log.txt