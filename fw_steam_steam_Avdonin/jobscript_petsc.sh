#!/usr/bin/env zsh

### Job name
#BSUB -J steam

### File / path where STDOUT will be written, the %J is the job id
#BSUB -o steam.%J

### (OFF) Different file for STDERR, if not to be merged with STDOUT
# #BSUB -e OMP12JOB.e%J

### Request the time you need for execution in minutes
### The format for the parameter is: [hour:]minute,
### that means for 80 minutes you could also use this: 1:20
### -We is estimated runtime; -W hard time limit
#BSUB -W 96:00

### Request vitual memory you need for your job in MB
#BSUB -M 4096

### Specify your mail address
#BSUB -u hbuesing@eonerc.rwth-aachen.de

### Send a mail when job is done
#BSUB -N

### Associate the job to the specified group
#BSUB -P rwth0026

### Request the number of compute slots you want to use
#BSUB -n 24

### Request HPCWORK
##BSUB -R "select[hpcwork]"

### Use esub for OpenMP/shared memeory jobs
#BSUB -a openmpi

### Export an environment var
export A_ENV_VAR=10
PETSC_DIR=/home/hb111949/petsc_opt
PETSC_ARCH=arch-linux2-c
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/hb111949/Code/shemat_suite/hdf5/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PETSC_DIR/$PETSC_ARCH/lib

### Change to the work directory
cd $(pwd) 

### Execute your application
./execute_lu.x 24
