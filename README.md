snakehive
=========
Tutorial and best practices for snakemake and hive

## Goals ##

- Minimal pre-installation (snakemake, conda)
- Examples of progressively more sophisticated snakemake pipelines
- Changing conda environments
- With and without slurm jobs
- Singularity/apptainer


## Pipeline Diagram ##

```
                  /---> Step 3a --- \
                 /                   \
Step 1 ---> Step 2                   Step 4 ---> Step X, Y, Z
                 \                   /
                  \---> Step 3b --- /

```
