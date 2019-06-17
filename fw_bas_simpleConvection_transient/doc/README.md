# Model Info: Simple 3D Convection modell, for transient. #

**Problems with transient computation**: Changing nummber of timesteps
changes the result, fewer timesteps leads to a result closer to steady
state, a lot more timesteps lead to a result where every cell is 10
degrees.


## Compilation on RWTH Cluster: ##

```
gmake fw hdf noomp PROPS=bas HDF5_MOD=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/include/ HDF5_LIB=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/lib/ COMPTYPE=lini64 
```



## Execution: ##

```
./shem_fw64gnu_basc.x > out.txt
```




total cpu time:    0: 1.03 min



