import random

ls_nums = [random.randint(1,10) for i in range(5)]

with open('infile.txt', 'w') as out:
    for n in ls_nums:
        out.write(f'{str(n)}\n')