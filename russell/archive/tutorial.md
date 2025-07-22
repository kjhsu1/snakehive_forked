# Snakemake tutorial

## Snakefile: step_1
This is a simple snakefile that creates an empty text file and an empty directory.

Goals of step_1:
- Learn basic syntax for rules in snakemake
- Learn to create files and directories

Line by line explanation:
- 1: `rule all:` is important for a snakefile because it defines the "goal" of the snakefile. It tells snakemake to check if the specified files exist in the current directory and runs other rules to create these files if needed. The way snakemake knows which rules to run is by finding the rule that has an output matching the missing file/s specified in `rule all` but not found in the current directory.

- 2: `input:` is used to indicate the start of list of intended outputs for the pipeline. This needs to be indented once in `rule all`.

- 3,4: Specifies the name of an output. In this case, `'s1_file.txt'`. Important to note that names are specified as a string with quotes. Also, multiple outputs are separated with commas, and they do not need to be on different lines. Best practices says to put them on different lines to keep outputs clear.

- 6: `rule touch:` This is an example of what a rule could be named. In this case, touch is used because it is a clear descriptor of the rule. Rules can be named anything and the name does not affect function. However, `all` is the default name that snakemake looks for as the rules that states all the output files.

- 7,8: `output:` This states the output of the rule. This output is matched with the inputs of `rule all` and is part of how snakemake determines which rules to run. Note how the name of the file is in string format specified by quotes.

- 9,10: `shell:` This portion of the rule states that a shell command is to be run. In this case, it will run the `touch` command. `{output}` is the syntax for `shell:` that specifies the file name given in `output:` is used here.

- 12-16: `rule mkdir:` This rule make a directory. The setup is similar to `rule touch` where the only difference is directories need to be explicitly stated in snakefiles using `directory(<name_of_dir>)`.

Notes:
- Rules: they are parts of the pipeline that can contain inputs, outputs, and commands to run. Their execution is managed by snakemake and each rule does not have to be in order of when they should be executed. Best practices says `rule all` should be the first rule in the snakemake pipeline.

- Directories do not have to be explictly stated in `rule all`

## Snakefile: step_2
This snakefile is an example of how to write into a file using shell command and python command

Goal:
- See how to write into files
- See differences between shell and python

Explanation:
- 9,10: Most important thing to to notice is how double quotes and single quotes can be used to specify a string in a shell command.

- 15-19: `run:` indicates that the following block is code that should be run when this rule is called. The language used in the `run:` block is python.

## Snakefile: step_3
This file is an example of feeding inputs into rules and doing something with the inputs.

Goals:
- Show how python code can be run before rules