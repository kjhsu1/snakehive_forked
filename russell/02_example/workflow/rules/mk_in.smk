rule get_read:
    input:
        config['genome']
    output:
        'resources/read{num}.fa'
    conda:
        '../envs/simple.yaml'
    log:
        stdout = 'workflow/logs/get_read.out{num}',
        stderr = 'workflow/logs/get_read.err{num}'
    script:
        '../scripts/get_read.py'

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
    shell:
        'makeblastdb -in {input} -out {output}/1pct -dbtype {params.dbtype} -input_type {params.in_type}'