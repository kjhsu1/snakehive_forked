import random
import sys

num = snakemake.wildcards.num

with open(snakemake.log['stdout'], 'w') as out, open(snakemake.log['stderr'], 'w') as err:
    sys.stdout = out
    sys.stderr = err
    print('This is stdout\n')
    print('This is stderr\n', file=err)
    with open(snakemake.output[0], 'w') as output, open(snakemake.input[0], 'r') as fp:
        genome = ''
        for line in fp:
            if '>' in line: continue
            genome += line.strip()
        start = random.randint(0,len(genome))
        read = genome[start:start+64]
        output.write(f'>read{num} {start}-{start+64}\n')
        output.write(read)
        print('len of read:', len(read))