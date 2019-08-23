Testmodel for verification and comparison of head-based and pressure-based computation

* Simple quasi 1D model (x-z) with coupled heat and fluid flow for verifying and comparing the (i) head-based and (ii) pressure-based solution of the flow equation with
  temperature and pressure dependent fluid properties:
  (i) solves the flow equation (Darcy) for hydraulic constant density reference potential (head) h0
  (ii) solves the flow equation (Darcy) for pressure P

* In addition, this testmodel gives an easy example for a pressure-based input file

* Model: 500 m (x) x 500 m (z), delx= delz= 10 m

* Compilation on CLAIX-18:
 (i) make fw hdf PROP=bas COMPTYPE=ling64 HDF5_LIB=$HDF5_ROOT/lib HDF5_MOD=$HDF5_ROOT/include -j 8 
 (ii) make pres fw hdf PROP=bas COMPTYPE=ling64 HDF5_LIB=$HDF5_ROOT/lib HDF5_MOD=$HDF5_ROOT/include -j 8 