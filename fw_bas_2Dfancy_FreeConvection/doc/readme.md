# Model 2D Fancy Geology - Free Convection #

This is a 2D benchmark model for free convection with a more complex geological structure. In comparison, model `fw_bas_pres_2Dfancy_FreeConvection`
is an example for the pressure-based simulation of the same model. 

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

