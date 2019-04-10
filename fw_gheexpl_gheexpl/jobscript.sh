#!/usr/bin/env zsh

### Job name
#BSUB -J marm

### File / path where STDOUT will be written, the %J is the job id
#BSUB -o mr272776.%J



### (OFF) Different file for STDERR, if not to be merged with STDOUT
# #BSUB -e OMP12JOB.e%J

### Request the time you need for execution in minutes
### The format for the parameter is: [hour:]minute,
### that means for 80 minutes you could also use this: 1:20
### -We is estimated runtime; -W hard time limit
#BSUB -W 72:00

### Request vitual memory you need for your job in MB
#BSUB -M 1024

### Specify your mail address
#BSUB -u mramirez-munoz@eonerc.rwth-aachen.de

### Send a mail when job is done
#BSUB -N

### Request the number of compute slots you want to use
#BSUB -n 16

### Use esub for OpenMP/shared memeory jobs
#BSUB -P gge
#BSUB -a openmp



### Export an environment var
xport A_ENV_VAR=10
###export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/mr272776/SHEMAT-Suite/hdf5/lib
###export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/mr272776/shemat_suite/hdf5/lib/

module switch intel gcc
module load LIBRARIES
module load hdf5

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lsf/9.1/linux2.6-glibc2.3-x86_64/lib/

### Change to the work directory
cd $(pwd) 

### Execute your application
shem_fw64gnu_ghe.x -tsolve 5 -tsample 12

