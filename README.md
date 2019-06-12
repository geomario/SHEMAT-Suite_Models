# SHEMAT-Suite_Models #

Here we collect `SHEMAT-Suite` input files including results. These
may serve as a benchmark test in the future.

**Exactly one input file per model directory!**

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

| **Models**                      | **Small description**                                              |
|:-------------------------------:|:------------------------------------------------------------------:|
| `ad_const_TemperatureInversion` | Testmodel for deterministic inversion (AD mode)                    |
| `fw_basc_SaltFlow`              | Model Info: Simple 2D transient model for flow and salt transport. |
| `fw_basc_Salt_small`            | Smaller version of the SaltFlow model                              |
| `fw_const_TheisProblem`         | 2D steady state model of a pumping test                            |
| `fw_bas_TinyAdvective`          | Testmodel for Advective Heat Transport                             |
| `fw_const_Peclet_down`          | vertical temperature profile influenced by vertical flow (down)    |
| `fw_const_Peclet_up`            | vertical temperature profile influenced by vertical flow (up)      |
| `fw_basc_HenryProblem`          | 2D Henry Problem: concentration entering flow regime               |
| `fw_kola_HeatConduction2D`      | heat conduction in water/ice mixture                               |
| `sm_const_MC_small`             | steady state flow for four random permeability realizations        |

| **Modes**                       | `fw` | `sm` | `ad` |
|:-------------------------------:|:----:|:----:|:----:|
| `ad_const_TemperatureInversion` |      |      | x    |
| `fw_basc_SaltFlow`              | x    |      |      |
| `fw_basc_Salt_small`            | x    |      |      |
| `fw_const_TheisProblem`         | x    |      |      |
| `fw_bas_TinyAdvective`          | x    |      |      |
| `fw_const_Peclet_down`          | x    |      |      |
| `fw_const_Peclet_up`            | x    |      |      |
| `fw_basc_HenryProblem`          | x    |      |      |
| `fw_kola_HeatConduction2D`      | x    |      |      |
| `sm_const_MC_small`             |      | x    |      |

| **Props**                       | `const` | `bas` | `basc` | `gheexpl` | `kola` |
|:-------------------------------:|:-------:|:-----:|:------:|:---------:|:------:|
| `ad_const_TemperatureInversion` | x       |       |        |           |        |
| `fw_basc_SaltFlow`              |         |       | x      |           |        |
| `fw_basc_Salt_small`            |         |       | x      |           |        |
| `fw_const_TheisProblem`         | x       |       |        |           |        |
| `fw_bas_TinyAdvective`          |         | x     |        |           |        |
| `fw_const_Peclet_down`          | x       |       |        |           |        |
| `fw_const_Peclet_up`            | x       |       |        |           |        |
| `fw_basc_HenryProblem`          |         |       | x      |           |        |
| `fw_kola_HeatConduction2D`      |         |       |        |           | x      |
| `sm_const_MC_small`             | x       |       |        |           |        |

| **Variables**                   | `head` | `temp` | `conc` | `head/temp` | `head/conc` | `head/temp/conc` |
|:-------------------------------:|:------:|:------:|:------:|:-----------:|:-----------:|:----------------:|
| `ad_const_TemperatureInversion` |        |        |        | x           |             |                  |
| `fw_basc_SaltFlow`              |        |        |        |             | x           |                  |
| `fw_basc_Salt_small`            |        |        |        |             | x           |                  |
| `fw_const_TheisProblem`         | x      |        |        |             |             |                  |
| `fw_bas_TinyAdvective`          |        |        |        | x           |             |                  |
| `fw_const_Peclet_down`          |        |        |        | x           |             |                  |
| `fw_const_Peclet_up`            |        |        |        | x           |             |                  |
| `fw_basc_HenryProblem`          |        |        |        |             | x           |                  |
| `fw_kola_HeatConduction2D`      |        | x      |        |             |             |                  |
| `sm_const_MC_small`             | x      |        |        |             |             |                  |

| **Grid**                        | `1D` | `2D` | `3D` |
|:-------------------------------:|:----:|------|:----:|
| `ad_const_TemperatureInversion` |      | x    |      |
| `fw_basc_SaltFlow`              |      | x    |      |
| `fw_basc_Salt_small`            |      | x    |      |
| `fw_const_TheisProblem`         |      | x    |      |
| `fw_bas_TinyAdvective`          |      | x    |      |
| `fw_const_Peclet_down`          | (x)  | x    |      |
| `fw_const_Peclet_up`            | (x)  | x    |      |
| `fw_basc_HenryProblem`          |      | x    |      |
| `fw_kola_HeatConduction2D`      |      | x    |      |
| `sm_const_MC_small`             |      | x    |      |

**(x)**: quasi-dimension, only effects in this number of dimensions


| **Time**                        | `Steady State` | `Transient` |
|:-------------------------------:|:--------------:|-------------|
| `ad_const_TemperatureInversion` | x              |             |
| `fw_basc_SaltFlow`              |                | x           |
| `fw_basc_Salt_small`            |                | x           |
| `fw_const_TheisProblem`         | x              |             |
| `fw_bas_TinyAdvective`          | x              |             |
| `fw_const_Peclet_down`          | x              |             |
| `fw_const_Peclet_up`            | x              |             |
| `fw_basc_HenryProblem`          | x              |             |
| `fw_kola_HeatConduction2D`      | x              |             |
| `sm_const_MC_small`             | x              |             |

| **Inversion**                   | `Deterministic Inversion` | `EnKF` |
|:-------------------------------:|:-------------------------:|:------:|
| `ad_const_TemperatureInversion` | x                         |        |
| `fw_basc_SaltFlow`              |                           |        |
| `fw_basc_Salt_small`            |                           |        |
| `fw_const_TheisProblem`         |                           |        |
| `fw_bas_TinyAdvective`          |                           |        |
| `fw_const_Peclet_down`          |                           |        |
| `fw_const_Peclet_up`            |                           |        |
| `fw_basc_HenryProblem`          |                           |        |
| `fw_kola_HeatConduction2D`      |                           |        |
| `sm_const_MC_small`             |                           |        |

| **Cluster architecture**        | `serial` | `openmp` | `mpi` | `Slurm Job` |
|:-------------------------------:|:--------:|:--------:|:-----:|:-----------:|
| `ad_const_TemperatureInversion` | x        |          |       |             |
| `fw_basc_SaltFlow`              | x        |          |       |             |
| `fw_basc_Salt_small`            | x        |          |       |             |
| `fw_const_TheisProblem`         | x        |          |       |             |
| `fw_bas_TinyAdvective`          | x        |          |       |             |
| `fw_const_Peclet_down`          | x        |          |       |             |
| `fw_const_Peclet_up`            | x        |          |       |             |
| `fw_basc_HenryProblem`          | x        |          |       |             |
| `fw_kola_HeatConduction2D`      | x        |          |       |             |
| `sm_const_MC_small`             | x        |          |       |             |

| **Verification method**         | `previous simulation` | `analytical solution` | `semi-analytical solution` |
|:-------------------------------:|:---------------------:|:---------------------:|:--------------------------:|
| `ad_const_TemperatureInversion` | x                     |                       |                            |
| `fw_basc_SaltFlow`              | x                     |                       |                            |
| `fw_basc_Salt_small`            | x                     |                       |                            |
| `fw_const_TheisProblem`         | x                     | (x)                   |                            |
| `fw_bas_TinyAdvective`          | x                     |                       |                            |
| `fw_const_Peclet_down`          | x                     | (x)                   |                            |
| `fw_const_Peclet_up`            | x                     | (x)                   |                            |
| `fw_basc_HenryProblem`          | x                     |                       | x                          |
| `fw_kola_HeatConduction2D`      | x                     |                       |                            |
| `sm_const_MC_small`             | x                     |                       |                            |


Possibly: Solver, Physical Problems (maybe better a list), possibly
every single input
