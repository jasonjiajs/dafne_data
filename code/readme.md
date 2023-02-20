# Code

## Stage 1

### Combine the raw Dafne .csv files into a big .csv file.

- Run `combine_dafne_data.ipynb` locally.

## Stage 2

### Filter the .csv file by keeping a subset of columns, and save it as a .dta file.

- Run `select_dafne_variables.do` locally.

### Filter the .csv file by keeping a subset of columns, and save it as a .csv file.

- Run `select_dafne_variables.py` on Mercury via `sbatch select_dafne_variables.sh`.

## Stage 3

### Merge the filtered .csv file with the Orbis mergefile on BvD ID.

- Run `merge_dafne_data_with_orbis_mergefile.py` on Mercury via `sbatch merge_dafne_data.sh`.