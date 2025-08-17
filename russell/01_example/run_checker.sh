#!/bin/bash

jid01=$(sbatch --parsable test.slurm)
jid02=$(sbatch --parsable --dependency=afterany:$jid01 test.slurm)
jid03=$(sbatch --parsable --dependency=afterany:$jid02 get_mem.slurm)