rule mk_input:
    output:
        'resources/01_input.sam'
    conda:
        '../envs/mk_input.yml'
    log:
        stdout='workflow/logs/mk_input.stdout',
        stderr='workflow/logs/mk_input.stderr'
    script:
        '../scripts/mk_input.py'