Source code for MPI SM (Monte Carlo) version of SHEMAT-Suite is available from GIT-branch 'mpi-sm'.


Compilation of MPI SM version on RWTH cluster:
_________________________________________________

module switch intel gcc
module load LIBRARIES
module load hdf5

make sm mpi noomp hdf PROPS=const COMPTYPE=ling64 HDF5_LIB=$HDF5_ROOT/lib/ HDF5_MOD=$HDF5_ROOT/include/ -j 8


Execution of MPI SM version on RWTH cluster:
_________________________________________________

module switch intel gcc
module load LIBRARIES
module load hdf5

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lsf/9.1/linux2.6-glibc2.3-x86_64/lib/

mpirun -n <N> shem_sm_sgsim64gnu_const.x 


Explanations:
--------------

N: number of processes
R: number of realizations

Number of processes <N> should be equal to the number of simulated realizations <R>. The number of realizations to be simulated has to be set in the model input file with the keyword # simulate:

# simulate 
<R>

Model input file: 'TM_2d_sm_head'
Current setting: 1 realization
Runtime: around 40 seconds for 1 realization on 1 process
