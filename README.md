# SHEMAT-Suite_Models #

Here we collect `SHEMAT-Suite` input files including results. These
may serve as a benchmark test in the future.


Naming convention:

`runmode_propsmodule_description`


Examples:

`fw_bas_2D-Heat-Transfer`\
`fw_mphase_const_2D-CO2-injection`\
`sm_bas_MonteCarlo`


Every Model folder should contain a `/doc` folder, which describes how
to compile and run the model. And a `/result` folder which collects
the output results.

## doc ##

### Model description ###

A short description of the model should also be put in the `/doc`
folder. This should first include a short explanation of the physics
behind the model. It can also contain a small note about the runtime
needed and the number of processes used to obtain this runtime.

### Compilation documentation ##

Please include the hash of the git commit of the compiled source code.

Otherwise follow the [Best
Practices](https://ggewiki.eonerc.rwth-aachen.de/index.php/Compilation#Compilation:_Best_Practices)
from our Wiki and put the corresponding files (`version.inc`,
`Makefile.flags`, the zipped source code) in the `/result/` path.


## deltatests ##

In the directory `deltatests`, there are routines for testing
`SHEMAT-Suite` output from new executables against archived output in
the `result` folder of the Modles directories (example:
`SHEMAT-Suite_Models/fw_const_TheisProblem/result`).

To use the routines, change directory to
`SHEMAT-Suite_Models/deltatests`.  Check the specifications at the
beginning of the script `runSHEMATtest.ipy`. Then, execute the IPyton
script, for example by entering the following command .

``` shell
python runSHEMATtest.ipy
```

### Adding new deltatests ###

To add new tests, look at
`deltatests/site-packages/test_fw_const_TheisProblem.py` and add an
analogous python file for the new `SHEMAT-Suite_Model` directory. This
should be possible by copying and changing some directory
specifications. Finally, add an `import` statement and an `addTest`
command in `SHEMATtest.py`.

## Matrix of models against features ##

|                                 | Modes | `fw` | `sm` | `ad` | `dd` | `fl` | Props | `const` | `bas` | `basc` | `gheexpl` | `kola` | Variables | `head` | `temp` | `conc` | `head/temp` | `head/conc` | `head/temp/conc` |
|:-------------------------------:|:-----:|:----:|:----:|:----:|:----:|:----:|:-----:|:-------:|:-----:|:------:|:---------:|:------:|:---------:|:------:|:------:|:------:|:-----------:|:-----------:|:----------------:|
| `ad_const_TemperatureInversion` |       |      |      | x    |      |      |       | x       |       |        |           |        |           |        |        |        | x           |             |                  |
| `fw_basc_SaltFlow`              |       | x    |      |      |      |      |       |         |       | x      |           |        |           |        |        |        |             | x           |                  |
| `fw_basc_Salt_small`            |       | x    |      |      |      |      |       |         |       | x      |           |        |           |        |        |        |             | x           |                  |
| `fw_const_TheisProblem`         |       | x    |      |      |      |      |       | x       |       |        |           |        |           | x      |        |        |             |             |                  |

