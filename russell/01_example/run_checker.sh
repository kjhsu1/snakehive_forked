#!/bin/bash

jid01=$(sbatch --parsable test.slurm)
jid02=$(sbatch --parsable --dependency=afterany:$jid01 test.slurm)
jid03=$(sbatch --parsable --dependency=afterany:$jid02 test.slurm)
jid04=$(sbatch --parsable --dependency=afterany:$jid03 test.slurm)
jid05=$(sbatch --parsable --dependency=afterany:$jid04 test.slurm)
jid06=$(sbatch --parsable --dependency=afterany:$jid05 test.slurm)
jid07=$(sbatch --parsable --dependency=afterany:$jid06 test.slurm)
jid08=$(sbatch --parsable --dependency=afterany:$jid07 test.slurm)
jid09=$(sbatch --parsable --dependency=afterany:$jid08 test.slurm)
jid10=$(sbatch --parsable --dependency=afterany:$jid09 test.slurm)
jid11=$(sbatch --parsable --dependency=afterany:$jid10 get_mem.slurm)