# Model 2D Fancy Geology - Forced Convection #

This is a 2D benchmark model for pressure-based computation of forced convection with a more complex geological structure. In comparison, model `fw_bas_2Dfancy_ForcedConvection`
is an example for the head-based simulation of the same model. In contrast to the free convection simulation, there is a varying pressure gradient at the top model boundary and unit permeabilities are higher, causing advection and advective heat transport. 

It has 220x1x119 cells with 50x50x50 m discretization. 

Workflow for pressure-based modeling with SHEMAT-Suite:
1. Hydrostatic initial conditions (file `forced_init`): Simulate initial hydrostatic pressure field for local thermal conditions.
2. Thermal initial conditions (file `forced_init_thermal`: Simulate initial thermal conditions for realistic model structure with initial conditions from *1*.
3. Flow and heat transport model: Coupled simulation with realistic model structure and initial conditions from *1* (for pressure) and *2* (for temperature). Note that pressure needs a noflow boundary condition at the base.

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

