[![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/RWTH_Logo_3.svg/320px-RWTH_Logo_3.svg.png)](http://www.rwth-aachen.de/cms/~a/root/?lidx=1)
# Single Groundsource Heat Exhcanger model for SHEMAT-Suite

Description for a basic numerical simulation for a groundsource heat exchanger (GHE) in SHEMAT-Suite. File requirements, data requirements and general procedure.

[![SHEMAT](https://img.shields.io/badge/SHEMAT-example-orange.svg)](https://www.springer.com/de/book/9783540438687)

## Implementation

As any other SHEMAT Suite model, in order to simulate GHEs there are some input files as requirement. All these files have to be at the same directory for future SHEMAT execution:

- [ ] Compile Source                       ---> [Compilation][c74de83a]
- [ ] GHE parameter file                   ---> [GHE-Module][324b04e0]
- [ ] GHE initial conditions file          ---> [GHE-Module][324b04e0]
- [ ] Classic SHEMAT input file            ---> [SHEMAT-SUITE Input File][63a42ee8]

  [63a42ee8]: https://ggewiki.eonerc.rwth-aachen.de/index.php/Input_File "INPUT FILE"
  [324b04e0]: https://ggewiki.eonerc.rwth-aachen.de/index.php?title=GHE-Module_for_heat_exchanger_simulations&action=edit&redlink=1 "GHE-Module-SHEMAT-Suite"
  [c74de83a]: https://ggewiki.eonerc.rwth-aachen.de/index.php/Compilation "Compilation GHE"

## Brief explanation
### 1. Compile the source code
To simulate specifically GHE within SHEMAT, it has to be set within the command line the specific PROPS and USER in order to get the executable already compiled and ready for simulate.

```linux
PROPS=gheexpl USER =gheexpl
```

Other parameters are already explained in the wiki page from the SHEMAT-SUITE within the section "compilation" (Check the list). For instance:

```linux
gmake fw COMPTYPE=ling64 PROPS=gheexpl USER=gheexpl hdf HDF5_LIB=$HDF5_ROOT/lib HDF5_MOD=$HDF5_ROOT/include -j 12
```




## Usage


## License
[MIT](https://opensource.org/licenses/MIT)
### Happy simulating!
