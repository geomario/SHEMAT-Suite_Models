# Verification for two-dimensional flow #

2D steady state model of a pumping test, model is similar to the Theis
Problem described in Clauser (2003), chapter 2.6.1.

Numerical simulations with MODFLOW (Processing Modflow 8, Simcore),
Processing SHEMAT (Clauser 2003) and SHEMAT-Suite show nearly the same
results. 

For comparison to the analytical solution after Theis see
Clauser(2003) and the test model
`fw_const_Theis_analytical_comparison`.

date: September 2015
contact person: Johanna Bruckmann

Run time: 18 seconds serially

## Code Compilation on RWTH Cluster ##

module switch intel gcc
make fw nohdf PROPS=const COMPTYPE=ling64 -j 8

Model Execution:

```
./shem_fw64gnu_const.x > out.txt
```

## Citations ##

Clauser, C., Numerical simulation of reactive flow in hot aquifers:
shemat and processing shemat (2003), : Springer-Verlag Berlin
Heidelberg New York.

Segol, G., Classic groundwater simulations: proving and improving
numerical models (1994), Prentice Hall.
