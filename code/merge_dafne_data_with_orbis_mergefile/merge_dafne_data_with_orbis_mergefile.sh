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

#SBATCH --job-name=merge_dafne_data_with_orbis_mergefile
#SBATCH --output=out/merge_dafne_data_with_orbis_mergefile_%A_%a_%J.out 

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
df1filepath="$2"
df2filepath="$3"
outputfilepath="$4"
left_on="$5"
right_on="$6"

echo "Program Filepath: $program_filepath"
echo "df1 Filepath: $df1filepath"
echo "df2 Filepath: $df2filepath"
echo "Output Filepath: $outputfilepath"
echo "left_on: $left_on"
echo "right_on: $right_on"

echo "-------------------------------------------"

srun python3 $program_filepath $df1filepath $df2filepath $outputfilepath $left_on $right_on

echo "Done!"

#---------------------------------------------------------------------------------
# Example command (Note: For the outputfilepath, we exclude the suffix because we will be saving in bth .csv and .dta)
# cd /project/kh_mercury_1/dafne_data/code/merge_dafne_data_with_orbis_mergefile
# sbatch merge_dafne_data_with_orbis_mergefile.sh merge_dafne_data_with_orbis_mergefile.py /project/kh_mercury_1/dafne_data/output/combined_filtered/dafne_export_filtered_20230217.csv /project/kh_mercury_1/dafne_data/output/orbis_mergefile_filtered/merge_june2019_filtered.csv /project/kh_mercury_1/dafne_data/output/merged_with_orbis_mergefile/dafne_merged_20230217 'bvd_id_number_2011' 'bvdid_2019'

# View first 10 rows of csv file
# head -n 10 /project/kh_mercury_1/dafne_data/output/merged_with_orbis_mergefile/dafne_merged_20230217.csv

# View first 10 rows of csv file and save to .csv for Kilian to view
# head -n 10 /project/kh_mercury_1/dafne_data/output/merged_with_orbis_mergefile/dafne_merged_20230217.csv > /project/kh_mercury_1/dafne_data/output/merged_with_orbis_mergefile/dafne_merged_20230217_10rows.csv
