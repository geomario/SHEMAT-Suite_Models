---Model input files:---

Synres1                 -       Main input file for SHEMAT-Suite
sgsimk.par              -       Input file for SGSim algorithm which is needed for Monte Carlo simulations
logk_normal.dat         -       Data file which is needed for SGSim algorithm
shemade.job             -       Control file for SHEMAT-Suite containing the name of model input files which will be simulated

---Source Code:---
Available from RWTH Git: https://git.rwth-aachen.de/
Branch: mpi-sm or mpi-sm-hdf5 (with hdf5 input converter)

---How to Compile on CLAIX-18:---

$ make clean
$ make sm mpi noomp hdf COMPTYPE=ling64 PROPS=const HDF5_LIB=$HDF5_ROOT/lib HDF5_MOD=$HDF5_ROOT/include -j 8


---How to Execute on CLAIX-18:---

SLURM batch job script: submit.job
Submit job:
$ sbatch submit.job

---How to Execute on CLAIX-18, 2:---

New executable (06/2019):

./shem_sm_sgsim64int_const_master_individual.x

---Additional Information:---
2-dimensional, steady state model which solves the flow equation.
Computes four random realizations of the permeability field.
The number of realizations to be computed is defined in the input file Synres1 with the keyword # simulate.

The file submit.job provides an exemplary CLAIX-18 batch script for this model.

Example for the MPI parallel Monte Carlo code.


* Total runtime: around 80 seconds


* contact person: Johanna Bruckmann
* date: April 2019
