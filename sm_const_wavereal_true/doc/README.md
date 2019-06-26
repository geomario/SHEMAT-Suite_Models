# sm_const_wavereal_true #

2D model with head and concentration.

A permeability field is generated using `SGSim`.

The concentration flows from south to north through the head field
that is influenced by the random permeabilities.

## Compilation ##

The files 
```
Makefile_sm_sgsim64int_const_master_individual.flags
module_sm_sgsim64int_const_master_individual.inc
version_sm_sgsim64int_const_master_individual.inc
```
contain the compilation information.


## Execution ##

``` shell
./shem_sm_sgsim64int_const_master_individual.x > out.txt
```
