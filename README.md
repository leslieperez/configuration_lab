# Automatic algorithm configuration with irace lab

This repository contains the an example of a configuration scenario setup for irace.

## Before starting

### Install irace
Install irace, go to the R console and type:

```R
install.packages("irace")
```

All this lab can be executed from the R console, but if you prefer you can interact with irace from the terminal following the instructions below. In such case, take note of the directory where irace was installed as you will need it.

Check the package is properly installed in the R console:
```R
library("irace")
irace.usage()
```

Or in the terminal. For example, if irace has been installed in `/home/runner/R/x86_64-pc-linux-gnu-library/3.4/irace/` add `bin/irace` to the path to execute irace:
```
/home/runner/R/x86_64-pc-linux-gnu-library/3.4/irace/bin/irace --help
```

### Prepare target algorithm
The target algorithm in this lab is ACOTSP. A framework of Ant Colony Optimization algorithms for the Traveling Salesman Problem. 

https://iridia.ulb.ac.be/dorigo/ACO/aco-code/public-software.html

The sources are provided in the lab for convenience (Version 1.03, July 2021). Before starting you must compile the code which is in C. 
You can use the Makefile provided by:

```
cd ACOTSP-1.03/
make
cd ..
```

Once you compiled, you should see an acotsp executable file in the folder. You can test it by executing in the terminal:

```
ACOTSP-1.03/acotsp --help
```


## Ejecuting irace
### From the R console
IMPORTANT: Set the working directory in R to the root directory of this repository. Use:
```R
setwd("/path/to/repo/")
```

To execute irace from the R console you can:
```R
source("run-irace.R")
```
or you may want to read parameters and scenario directly:
```R
parameters = readParameters("parameters.txt")
scenario = readScenario("scenario.txt") 
irace(scenario = scenario, parameters=parameters)
```
### From the terminal
IMPORTANT: Go to the root directory of this repository. Use:

To use the script provided in this lab, you can execute:
```
Rscript run-irace.R
```
To run directly irace use the executable provided by the installation. For example, if irace has been installed in `/home/runner/R/x86_64-pc-linux-gnu-library/3.4/irace/` add `bin/irace` to the path to execute irace.

``` 
/home/runner/R/x86_64-pc-linux-gnu-library/3.4/irace/bin/irace --scenario scenario.txt
```

You might want to create a shortcut to execute the configurator from the shell (unix-based systems). You can create a shortcut in the current folder and use it with:

```
ln -s /home/runner/R/x86_64-pc-linux-gnu-library/3.4/irace/bin/irace .
./irace --scenario scenario.txt
```

## Enable the benchmark
Note that to make the execution quicker for initial setup, the target runner is not executing ACOTSP in the target runner procedures. To enable its execution, you must comment the lines in the target runner your are using.

In scenario file, comment or remove the line:
```
return(list(cost=runif(n=1, min=100, max=2000)))
```

In the target runner file, comment or remove the lines:
```
echo "$RANDOM"
exit 0
```

Check the slides provided in the slides directory for more information.





