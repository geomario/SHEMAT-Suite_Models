
Documentation Tiny Testmodel Advective Heat Transport

 * tiny 2D model with only 8x1x4=32 cells
 * coupled temp and head 
 * PROPS=bas
 * head gradient on top results in topography driven flow
 * fixed temperatures at top and bottom
 * conductive heat flow from base to top
 * steady state solution

########## Compilation release branch ##############################

 * Build executable from branch release:
 * Within source code directory:

Currently Loaded Modulefiles:
 1) DEVELOP             3) intelmpi/2018       5) hdf5/1.8.21        
 2) gcc/system-default  4) LIBRARIES           6) python/2.7.12  

$ mkdir build
$ cd build
$ cmake -DPROPS=bas ..
$ make fw 



########## Execution ###############################################
 * Within model directory
 * Batch script submit_fw.job:
---------------------------------------------------------------------------------------------------------------
#!/bin/bash -x
#SBATCH --job-name=test_adv
##SBATCH --mail-user=jbruckmann@eonerc.rwth-aachen.de
##SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
##SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:05:00
#SBATCH --output=out.txt
#SBATCH --error=err.txt

module load LIBRARIES
module load hdf5/1.8.21

export LD_LIBRARY_PATH=/usr/local_rwth/sw/HDF5/1.8.21/gcc_4.8.5-intelmpi_2018.4.274/lib:$LD_LIBRARY_PATH

##/usr/local_rwth/sw/HDF5/1.10.4/gcc_4.8.5-intelmpi_2018.4.274/lib:$LD_LIBRARY_PATH

 ./shem_fw_bas.x  -tsolve 1 -tsample 1
---------------------------------------------------------------------------------------------------------------

 * Submit batch script: 

$ sbatch submit_fw.job

########## Additional Information ###############################################
 
 * Runtime: 3.42 s
 * model works also with PROPS=const
 




