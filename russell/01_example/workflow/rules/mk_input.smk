rule mk_input:
    output:
        'resources/01_input.sam'
    conda:
        '../envs/mk_input.yml'
    resources: 
        mem_kb=7500
    log:
        stdout='workflow/logs/mk_input.stdout',
        stderr='workflow/logs/mk_input.stderr'
    shell:
        '/Users/russell/.local/share/mamba/envs/snakemake_env/bin/time -v python3 workflow/scripts/mk_input.py {log.stdout} {log.stderr} {output} > {log.stdout} 2> {log.stderr}'