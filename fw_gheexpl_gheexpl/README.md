![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/RWTH_Logo_3.svg/320px-RWTH_Logo_3.svg.png)
# Single Groundsource Heat Exhcanger model for SHEMAT-Suite

Description for a basic numerical simulation for a groundsource heat exchanger (GHE) in shemat-suite. File requirements, data requirements and general procedure.

[![SHEMAT](https://img.shields.io/badge/SHEMAT-100%-orange.svg)](https://www.springer.com/de/book/9783540438687)

## Implementation

As any other SHEMAT Suite model, in order to simulate GHEs there are some input files as requirement.

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
