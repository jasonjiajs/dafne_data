#!/bin/bash

#---------------------------------------------------------------------------------
# Account information

#SBATCH --account=pi-kilianhuber # account you belong to 
#SBATCH --mail-user=jason.jia@chicagobooth.edu

#---------------------------------------------------------------------------------
# Resources requested (recommended parameters to specify)

#SBATCH --partition=highmem  # standard (default), long, gpu, mpi, highmem
#SBATCH --cpus-per-task=1     # number of CPUs requested (for parallel tasks)
#SBATCH --mem-per-cpu=128G     # requested memory
#SBATCH --time=1-00:00:00     # Time your job is allowed to run (d-hh:mm:ss)

#---------------------------------------------------------------------------------
# Array information

# #SBATCH --array=1-8

#---------------------------------------------------------------------------------
# Job specific name (helps organize and track progress of jobs, optional parameters)
# '%A': array-job ID (e.g. 7823505)
# '%a': task ID (e.g. 1, 2, 3)
# '%J': job ID (e.g. 7823507, 7823506, 7823505)

#SBATCH --job-name=select_orbis_mergefile_variables
#SBATCH --output=out/select_orbis_mergefile_variables_%A_%a_%J.out 

#---------------------------------------------------------------------------------
# Print some useful variables

echo "-------------------------------------------"
echo "Job ID: $SLURM_JOB_ID"
echo "Job User: $SLURM_JOB_USER"
echo "Num Cores: $SLURM_JOB_CPUS_PER_NODE"
echo "Array(Task ID): $SLURM_ARRAY_TASK_ID of $SLURM_ARRAY_TASK_COUNT"

#---------------------------------------------------------------------------------
# Load necessary modules for the job
# Check using `module avail`
module load python/booth/3.8

# Go into env
# source /home/jasonjia/standard_env_jason/bin/activate

#---------------------------------------------------------------------------------
# Commands to execute below...
program_filepath="$1"
input_filepath="$2"
output_filepath="$3"
echo "Program Filepath: $program_filepath"
echo "Input Filepath: $input_filepath"
echo "Output Filepath: $output_filepath"
echo "-------------------------------------------"

srun python3 $program_filepath $input_filepath $output_filepath

echo "Done!"

#---------------------------------------------------------------------------------
# Example command
# cd /project/kh_mercury_1/dafne_data/code/select_orbis_mergefile_variables
# sbatch select_orbis_mergefile_variables.sh select_orbis_mergefile_variables.py /project/kh_mercury_1/dafne_data/data/orbis_mergefiles/merge_june2019.csv /project/kh_mercury_1/dafne_data/output/orbis_mergefile_filtered/merge_june2019_filtered.csv

# View first 10 rows of csv file
# head -n 10 /project/kh_mercury_1/dafne_data/output/orbis_mergefile_filtered/merge_june2019_filtered.csv
