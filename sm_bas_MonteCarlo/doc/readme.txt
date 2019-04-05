---Model input files:---

./initial_model/PV2d_stat_init  -       Input file for initial steady-state simulation
SHEMAT_MC_MPI 		- 	Main input file for SHEMAT-Suite
PV2d_stat_init_final.h5 -	SHEMAT-Suite hdf5-output file from which initial conditions are read  
PV2d_sgsimk.par		-	Input file for SGSim algorithm which is needed for Monte Carlo simulations
logk_Festgestein.dat 	-	Data file which is needed for SGSim algorithm
datafl.dat  		-	Data file which is needed for SGSim algorithm
shemade.job		-	Control file for SHEMAT-Suite containing the name of model input files which will be simulated

---Source Code:---

Available from RWTH Git: https://git.rwth-aachen.de/
* For initial Model:
  Branch: master
* For MC model: 
  Branch: mpi-sm or mpi-sm-hdf5 (with hdf5 input converter)


---How to Compile on CLAIX-18:---

* For initial model from branch master:
$ module load LIBRARIES
$ module load hdf5
$ make clean
make fw hdf PROPS=bas HDF5_LIB=$HDF5_ROOT/lib HDF5_MOD=$HDF5_ROOT/include -j 8

* For MC model from branch mpi-sm:
$ module load LIBRARIES
$ module load hdf5
$ make clean
$ make sm mpi noomp hdf COMPTYPE=ling64 PROPS=bas HDF5_LIB=$HDF5_ROOT/lib HDF5_MOD=$HDF5_ROOT/include -j 8

---How to Execute on CLAIX-18:---

SLURM batch job script: submit.job
Submit job:
$ sbatch submit.job

---Additional Information:---

2-dimensional, transient model which solves the flow equation. Simulation of a pumping test.
Computes two random realizations of the permeability field.
The number of realizations to be computed is defined in the input file SHEMAT_MC_MPI with the keyword # simulate.   

The file submit.job provides an exemplary CLAIX-18 batch script for this model.

Example for the MPI parallel Monte Carlo code.


* Runtime:
----------------------------------
* contact person: Johanna Bruckmann
* date: April 2019
