[![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/RWTH_Logo_3.svg/320px-RWTH_Logo_3.svg.png)](http://www.rwth-aachen.de/cms/~a/root/?lidx=1)
# Single Groundsource Heat Exhcanger model for SHEMAT-Suite

Description for a basic numerical simulation for a groundsource heat exchanger (GHE) in shemat-suite. File requirements, data requirements and general procedure.

[![SHEMAT](https://img.shields.io/badge/SHEMAT-executable-orange.svg)](https://www.springer.com/de/book/9783540438687)

## Implementation

As any other SHEMAT Suite model, in order to simulate GHEs there are some input files as requirement:

- [ ] Compile Source Code
- [ ] GHE parameter file
- [ ] GHE initial conditions file
- [ ] Classic SHEMAT input file. More info ---> [SHEMAT-SUITE Input File][63a42ee8]
- [ ]

  [63a42ee8]: https://ggewiki.eonerc.rwth-aachen.de/index.php/Input_File "INPUT FILE"



1) Compile the source code
To simulate specifically GHE, it has to be set within the command line the specific PROPS and USER in order to get the executable already compiled and ready for simulate.

PROPS=gheexpl

USER =gheexpl

Other parameters are already explained in the wiki page from the SHEMAT-SUITE. For instance:

```linux
    gmake fw COMPTYPE=ling64 PROPS=gheexpl USER=gheexpl hdf HDF5_LIB=$HDF5_ROOT/lib HDF5_MOD=$HDF5_ROOT/include -j 12
```



## Usage


## License
[MIT](https://opensource.org/licenses/MIT)
### Happy simulating!
