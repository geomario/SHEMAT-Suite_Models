#!/bin/bash -x
#SBATCH --job-name=inv
#SBATCH --nodes=1
#SBATCH --ntasks=1
##SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=00:10:00
#SBATCH --output=out.txt
#SBATCH --error=err.txt

module load LIBRARIES
module load hdf5/1.8.21

export LD_LIBRARY_PATH=$DHF5_ROOT:$LD_LIBRARY_PATH

 ./shem_ad_const.x  -tsolve 8 -tsample 1
