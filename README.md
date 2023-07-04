# Processing Dafne Data

- This folder contains all codes and documentation for the task to process Dafne data. 
- It is cloned into both Dropbox (your work laptop) and Mercury under .../conference_call/code, 
so the two folders are identical as long as commits, pushes and pull requests are made regularly.
- Currently, there are 3 stages:
  - Stage 1: Combine the raw Dafne .csv files into a big .csv file. This is done locally as a .ipynb file.
  - Stage 2: Filter the .csv file by keeping a subset of columns, and save it as a .dta file. This is done locally on Stata as a do file.
  - Stage 3: Filter the .csv file by keeping a subset of columns, and save it as a .csv file. Then, combine the filtered .csv file with the Orbis mergefile on BvD ID. This is done on Mercury as a .py file.

## Folder directory

- `code`: code to process Dafne data
- `data`: raw Dafne data and Orbis mergefile
- `output`: processed Dafne data
- `.gitignore`: note that `data` and `output` are not in the GitHub repo. They are only available on Dropbox and Mercury.
