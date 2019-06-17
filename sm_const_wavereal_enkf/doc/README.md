# sm_const_wavereal_enkf #

2D model with head and concentration

The concentration flows from south to north through the head field
that is influenced by the random permeabilities.

A number of permeability fields is generated using `SGSim`.

An `EnKF update` is carried out. Due to different `random` functions
(pseudo-random-number generators) for `gcc` and `intel` compilers, two
truths will be generated, one for `gcc` and one for `intel`.

These truths will are also generated for ensemble size `10,000` to
show that, when stochastic perturbatinos are minimized, the results of
the two compilers `gcc` and `intel` converge.

## Compilation ##

The files 
```
Makefile_sm_sgsim64<comp>_const_master_<hdf>individual.flags
module_sm_sgsim64<comp>_const_master_<hdf>individual.inc
version_sm_sgsim64<comp>_const_master_<hdf>individual.inc

```

contain the compilation information, where `<comp>` can be `gnu` and
`int`; `<hdf>` can be empty or `nohdf_`.

There are two different types of executables, `gcc` and `intel`
compiled, as well as `hdf` and `nohdf`. `nohdf` is used for the large
runs as to not generate too large output.

## Execution ##

``` shell
./shem_sm_sgsim64<comp>_const_master_<hdf>individual.x > out.txt
```

