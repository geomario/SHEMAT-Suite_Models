# fw_const_Theis_analytical_comparison #

Theis comparison with analytical formula from SHEMAT book Clauser2003.

The main problem is a numerical difference between the pumping rate
from the analytical formula:

```
Q = 0.004 m3/s
```
and the SHEMAT-Suite input for the Neumann boundary condition

```
# head bcn, records=1, direction=0
1 1 1 -0.001d0 0
```
## Python scripts ##

`theis_analytical.ipy`: Computes the Theis-analytical solution and
compares it to the SHEMAT-Suite result loaded from the vtk files in
`/result/`. The figures are saved in `/doc/pdfs/`.

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

Clauser, C., Numerical simulation of reactive flow in hot aquifers:
shemat and processing shemat (2003), : Springer-Verlag Berlin
Heidelberg New York.

