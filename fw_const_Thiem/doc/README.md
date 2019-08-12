# fw_const_Thiem #

Thiem comparison with analytical formula from Batu1998.

The largest differences between the SHEMAT-Suite solution and the
analytical solution arise (1) near the well and (2) near the boundary
conditions.

The boundary condition of 20m head has been set for all cells that are
further away from the center of the model than 530m.

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

## Citations ##

Batu, V., Aquifer hydraulics : a comprehensive guide to hydrogeologic
data analysis (1998), : Wiley, New York.
