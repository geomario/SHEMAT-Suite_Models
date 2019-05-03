Compiled SHEMAT-Suite from branch cmake in AD mode on RWTH Aachen Cluster CLAIX-18:

$ git checkout cmake
$ mkdir build_const
$ cd build const
$ cmake -DPROPS=const -DUSER=none ..
$ make ad


* date: 2019/04/03
* version: branch cmake 54d9916a 

* date: 2019/05/03
* Need:
$ module switch intel gcc
$ module load LIBRARIES
$ module load hdf5

Execution on CLAIX-18 via batch job submission, file submit.sh:
$ sbatch submit.sh
