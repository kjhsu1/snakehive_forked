# Template

## Goal
- Act as a simple starting point for a Snakemake pipeline
- Adhere to best practices for Snakemake

## Explanation
- `resources` is where all files that are used in the pipeline goes. Some example of these are genomes or sequencing reads. The reason they are not incorporated with the workflow is that they can be used in other workflows. So having them outside of a workflow allows them to be easily accessed by other workflows.

- `results` is where the results of the workflow go. This folder is outside of the workflow just to make it easier to access results and it is not directly used in the workflow.

- `profile` is used in the CLI Snakemake command to tell Snakemake what specifications to run with. For example, number of cores or amount of memory are different things that can be put into a config file. Snakemake looks specifically for `config.yaml` when using the `--profile`.

- `config` is where different parameters are put that are used in multiple rules. For example, names of sample or path to reference genome.

- `workflow` is where the all the files that get Snakemake pipeline to work go.

- `Snakefile` is the file that Snakemake references to run the pipeline. Snakemake specifically looks for the snakefile to be named `Snakefile` as a default. To specify a different name, use `--snakefile` or `-s` flag followed by the snakefile name.

- 'envs` is where all the different environments used in the pipeline are stored. They have their own folder for organization. All environments have the `.yml` or `.yaml` extension.

- `logs` is where the logs for the pipeline goes. It usually contains stdout and stderr files for the rules that are ran.

- `scripts` is where all the scripts that are run by the snakefile rules are stored. They are kept together for organization. They are either R or Python scripts.

# 01_example

## Goal
- Show example of what a basic Snakemake pipeline looks like
- Use best practices when writing a pipeline

## Explanation of Snakefile
`configfile` is specifies the global config file for this Snakefile. It can be called on by using the variable `config` (no quotes), or it can be called on in scripts using `snakemake.config`. Specific configs can be called on with this syntax `config['<some_variable>']`.

`rule all` should be the first rule in any Snakefile. It is the default rule that Snakemake looks for as its target rule.
- Target rule is the rule that specifies the intended output for the whole Snakefile.

`module` loads in a snakefile of rule/s that is from somewhere outside of this Snakefile. For best practices all snakefiles used loaded in with module must have the `.smk` extension. This will make it clear what kind of file it is just by the name. This need to contain a `config` directive if the rule that the module runs uses a script. When running shell commands, there does not need to be a `config` directive.

`use rule * from <module>` tells Snakemake to use all rules from a specific module. The rule that is used can be customized and does not have to be `*`.

## Explanation of Snakemake Rules
All rules with the exception of `rule all` should contain these directives:
- output
- log
- conda

`output` is needed so that the rule produces something.

`log` is used to specify the names and/or paths of log files. This directive should contain `stdout` and `stderr` and have the file extentions `.out` and `.err` respectively. Separating standard output and standard error allows each to be differentiated easier without having to tag each output in a single file.

`conda` is used to specify a yaml file containing instructions for a conda environment. Depending on the purpose of the Snakefile, this should either be set per file or per rule. Setting a conda environment helps with reproducibility.

`shell` is used to run shell commands as Snakemake cannot run shell scripts.

`script` should almost always used to run python code instead of using `run` directive. The reason for this is that it keeps the Snakefile cleaner and allows the code to be reused in other Snakefiles. Using a script also allows for easier testing without having to run the Snakefile.

## Explanation of Snakemake Scripts
Snakemake can take either python or R scripts. For python scripts, variables in the rule that script is run in can be accessed with `snakemake.<directive>[0]`. This is refering to the first variable or string in a directive.

# 02_example

## Goals:
- Provide exmaple of wildcard usuage
- Provide example of how config files are used
- Provide example of `params` directive

## Snakefile Explanation
`rule all` is where wildcards should be expanded using `expand()`.  `expand()` used in conjunction with wildcards allows multiple similar files to be called on without having to explictly stating each one. In this case, the name of the wildcard is `num` and it corresponds `trials` in the config file.

## More Snakemake Rules Explanation
In any rule, contents of a config file can be accessed using `config['<someconfig>']`. When a .smk file is used in the main Snakefile, the config file must be specified in a directive called `config` in the module. After specifying the config file in the main Snakefile, configs can be accessed in the .smk file as if it is part of the main Snakefile.

`params` is a directive that allows for more variables to be specified outside of the code that is run. In this example, `rule mk_db` inside of `mk_in.smk` uses `params` as a way to specify flags. Specifying flags outside of the code that is run makes it more clear what the flags are and makes them easier to change if needed.

## Why use config files
Config files should be used to keep the main Snakefile clear. Everything in the config file can be specified before `rule all` in the Snakefile, but that could get messy and make the logic of the workflow harder to follow.