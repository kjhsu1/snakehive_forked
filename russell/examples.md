# Template

## Goal
- Act as a simple starting point for a Snakemake pipeline
- Adhere to best practices for Snakemake

## Explanation


# 01_example

## Goal
- Show example of what a basic Snakemake pipeline looks like
- Use best practices when writing a pipeline

## Explanation of Snakefile
`rule all` should be the first rule in any Snakefile. It is the default rule that Snakemake looks for as its target rule.
- Target rule is the rule that specifies the intended output for the whole Snakefile.

All rules with the exception of `rule all` should contain these directives:
- output
- log
- conda

`output` is needed so that the rule produces something.

`log` is used to specify the names and/or paths of log files. This directive should contain `stdout` and `stderr` and have the file extentions `.out` and `.err` respectively. Separating standard output and standard error allows each to be differentiated easier without having to tag each output in a single file.

`conda` is used to specify a yaml file containing instructions for a conda environment. Depending on the purpose of the Snakefile, this should either be set per file or per rule. Setting a conda environment helps with reproducibility.

`script` should almost always used to run python code instead of using `run` directive. The reason for this is that it keeps the Snakefile cleaner and allows the code to be reused in other Snakefiles. Using a script also allows for easier testing without having to run the Snakefile.

