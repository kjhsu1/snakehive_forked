# TLDR
Russell is building Snakemake workflow templates and examples, and running resource-usage experiments for tools like BLAST and samtools while collecting notes on best practices.

## Documentation
### examples.md
- Describes a reusable Snakemake template and explains the roles of standard folders such as `resources`, `results`, `local`, `config`, and `workflow`【F:russell/examples.md†L1-L26】
- Details example pipelines showing modules and rule structure for a basic workflow and the use of wildcards, configs, and params【F:russell/examples.md†L35-L79】

### ideas.md
- Lists Snakemake directives (input, output, shell, run, script, conda, log, threads, resources, etc.) and best practices for organizing workflows【F:russell/ideas.md†L10-L57】
- Notes potential projects such as testing resource usage and running BLAST with many reads in parallel【F:russell/ideas.md†L59-L63】

## Snakemake Workflow Examples
### 00_example
- Minimal pipeline that delegates work to modules `mk_input` and `mk_output` via a central Snakefile【F:russell/00_example/workflow/Snakefile†L1-L19】
- Local profile config specifies using mamba-based conda with one core【F:russell/00_example/local/config.yaml†L1-L4】

### 01_example
- `mk_input` rule writes a small SAM file through a Python script and logs stdout/stderr【F:russell/01_example/workflow/rules/mk_input.smk†L1-L13】【F:russell/01_example/workflow/scripts/mk_input.py†L1-L18】
- `mk_output` converts the SAM to BAM with `samtools view` under a conda env and resource limits【F:russell/01_example/workflow/rules/mk_output.smk†L2-L16】

### 02_example
- Snakefile loops over a configured number of trials and expands results with wildcards【F:russell/02_example/workflow/Snakefile†L3-L21】
- `mk_in.smk` generates random reads and builds a BLAST database; `blast.smk` runs `blastn` against it, capturing logs and resource usage【F:russell/02_example/workflow/rules/mk_in.smk†L1-L26】【F:russell/02_example/workflow/rules/blast.smk†L1-L22】

## Templates
- `template` folder contains a bare-bones Snakefile with only a placeholder target, illustrating the layout of a new workflow【F:russell/template/workflow/Snakefile†L1-L3】

## Memory Prediction Pipelines
### mem_predict/blast
- Snakefile assembles modules to create reads, capture resource metrics, and graph BLAST performance into `blast_res_usage.pdf`【F:russell/mem_predict/blast/workflow/Snakefile†L1-L27】
- `mk_in.smk` sweeps word sizes and thread counts while running `blastn`, recording usage parameters【F:russell/mem_predict/blast/workflow/rules/mk_in.smk†L49-L72】
- `get_res.smk` filters timing logs and combines them into a CSV for plotting, which `graph_creation.smk` converts into a PDF chart【F:russell/mem_predict/blast/workflow/rules/get_res.smk†L1-L38】【F:russell/mem_predict/blast/workflow/rules/graph_creation.smk†L1-L12】

### mem_predict/sam
- Pipeline creates synthetic SAM files of varying lengths, converts them to BAM with `samtools`, and graphs memory usage【F:russell/mem_predict/sam/workflow/Snakefile†L1-L27】
- `mk_in.smk` generates input SAM files and times samtools conversions; `get_res.smk` extracts memory info and aggregates results before `graph_creation.smk` plots them【F:russell/mem_predict/sam/workflow/rules/mk_in.smk†L1-L24】【F:russell/mem_predict/sam/workflow/rules/get_res.smk†L1-L38】【F:russell/mem_predict/sam/workflow/rules/graph_creation.smk†L1-L12】

## Archive
- Step-by-step tutorial files demonstrate basic Snakemake features: creating files and directories, writing via shell or Python, and sorting numbers from an input file【F:russell/archive/step_1†L1-L16】【F:russell/archive/step_2†L1-L16】【F:russell/archive/step_3†L1-L37】
