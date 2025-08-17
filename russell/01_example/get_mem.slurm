#!/bin/bash
#SBATCH --job-name=get_mem
#SBATCH --account=publicgrp
#SBATCH --partition=low
#SBATCH --output=jobs/%x/get_mem.out
#SBATCH --err=jobs/%x/get_mem.err
#SBATCH --cpus-per-task=1
#SBATCH --mem=500MB
#SBATCH --time=15:00

printf "JobID\tMaxRSS\n" > mem_used.txt
for file in jobs/*_in; do
    jobid=${file#*/}
    jobid=${jobid%_*}
    echo $jobid
    sacct -j $jobid --format=JobID,MaxRSS --noheader >> mem_used.txt
done