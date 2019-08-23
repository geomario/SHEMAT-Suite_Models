# Model 2D Fancy Geology - Forced Convection #

This is a 2D benchmark model for forced convection with a more complex geological structure. In comparison, model `fw_bas_pres_2Dfancy_ForcedConvection`
is an example for the pressure-based simulation of this model. 
Only a difference in the top head boundary results in a resulting head which is 25 m higher than for the pressure-based model.
The head gradient at the top of the model and higher permeabilities cause forced convection, i.e. advection and advective heat transport. 

It has 220*1*119 cells with 50*50*50 m discretization. 

date: August 2019
contact person: Johanna Bruckmann

## hdf5 version ##

The executables of this model were compiled with `hdf5/1.8.21`. This is at the moment not the default version, so you have to load it manually using.

```
module load hdf5/1.8.21
```

or, if you already have loaded `hdf5`

```
module switch hdf5 hdf5/1.8.21
```

