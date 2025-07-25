import sys

with open(snakemake.log['stdout'], 'w') as out, open(snakemake.log['stderr'], 'w') as err:
    sys.stdout = out
    sys.stderr = err

    print('error message', file=sys.stderr)

    print('start of script')

    with open(snakemake.output[0], 'w') as out:
        out.write('@HD\tVN:1.6\tSO:unsorted\n')
        out.write('@SQ\tSN:chr1\tLN:2048\n')
        out.write('read1\t0\tchr1\t1\t255\t8M\t*\t0\t0\tACTGACTG\t*')

    print('end of script', flush=True)