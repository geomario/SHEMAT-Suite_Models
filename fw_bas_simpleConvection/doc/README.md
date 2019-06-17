# Model Info: Simple 3D Convection modell, for steady state. #

Problems with transient computation: look description in modell or
readme of transient modell.


## Compilation on RWTH Cluster: ##

```
gmake fw hdf noomp PROPS=bas HDF5_MOD=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/include/ HDF5_LIB=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/lib/ COMPTYPE=lini64 
```

Compilation documentation:
```
Makefile_fw64int_bas_master_individual.flags
module_fw64int_bas_master_individual.inc
version_fw64int_bas_master_individual.inc
```


## Execution: ##

``` shell
./shem_fw64gnu_basc.x > out.txt
```


total cpu time:    0: 0.28 min


