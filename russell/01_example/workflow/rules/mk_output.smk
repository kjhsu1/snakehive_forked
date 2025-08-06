
rule mk_output:
    input:
        'resources/01_input.sam'
    output:
        'results/01_output.bam'
    conda:
        '../envs/mk_output.yml'
    resources:
        mem_kb=1500
        threads=1
    log:
        stdout='workflow/logs/mk_output.out',
        stderr='workflow/logs/mk_output.err'
    shell:
        '/Users/russell/.local/share/mamba/envs/snakemake_env/bin/time -v sh -c "samtools view -bS {input} > {output}" 2> {log.stderr}'