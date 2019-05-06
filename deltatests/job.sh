#!/usr/local_rwth/bin/zsh

### Job name
#SBATCH -J test_{shem_type_name}_{props}_{model_name}
### File where output will be written %J is the jobID
#SBATCH -o test_{shem_type_name}_{props}_{model_name}_%J.txt
### Account under which the job should be executed
###SBATCH -A rwth0009

### Request the number of compute slots
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
### Request time needed for execution in hours:minutes:seconds (killed if it needs longer)
#SBATCH -t 00:30:00
### Request Memory per core
#SBATCH --mem=1000M

### Number of hyperthreads per core
#SBATCH --ntasks-per-core=1
### Tasks per node (for shared-memory parallelisation, use 1)
#SBATCH --ntasks-per-node=1

### Mail address
#SBATCH --mail-user=jkeller@eonerc.rwth-aachen.de
### Send mail when job dispatched (starts running) and done
#SBATCH --mail-type=ALL

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK


# Module configuration (for debugging, remove 2> /dev/null)
module purge 2> /dev/null
module load {module0} 2> /dev/null
module load {module1} 2> /dev/null
module load {module2} 2> /dev/null
module load {module3} 2> /dev/null
module load {module4} 2> /dev/null

### Execute application
chmod 770 {exe_name}

./{exe_name} -tsolve 1 -tsample 1
