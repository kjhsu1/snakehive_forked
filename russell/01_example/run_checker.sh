#!/bin/bash

declare -a jid
num_trials=5

for num in $(seq 1 $num_trials); do
   if [ $num -eq 1 ]; then
        jid[$num]=$(sbatch --parsable snakerun.slurm)
    else
        jid[$num]=$(sbatch --parsable --dependency=afterany:${jid[$((num-1))]} snakerun.slurm)
    fi
done