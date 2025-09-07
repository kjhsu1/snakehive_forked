rule get_read:
    input:
        config['genome']
    output:
        'resources/trial{num}_reads.fa'
    conda:
        '../envs/simple.yaml'
    log:
        out = 'workflow/logs/get_read.out{num}',
        err = 'workflow/logs/get_read.err{num}'
    params:
        nreads = config['reads']['number'],
        lenread = config['reads']['length']
    resources:
        mem_mb=256
    shell:
        '''
        command time -v python3 workflow/scripts/get_read.py \
        --nreads {params.nreads} \
        --lenread {params.lenread} \
        --genome {input} \
        --out {output} \
        --stdout {log.out} \
        --stderr {log.err} \
        2>> {log.err}
        '''

rule mk_db:
    input:
        config['genome']
    output:
        directory('resources/1pct_db')
    conda:
        '../envs/blast.yaml'
    log:
        stdout = 'workflow/logs/mk_db.out',
        stderr = 'workflow/logs/mk_db.err'
    params:
        dbtype = 'nucl',
        in_type = 'fasta'
    resources:
        mem_mb=175
    shell:
        '''
        command time -v makeblastdb \
        -in {input} \
        -out {output}/1pct \
        -dbtype {params.dbtype} \
        -input_type {params.in_type} \
        > {log.stdout} 2> {log.stderr}
        '''