# Data generation scripts
- first edit/run ttbarW.sh to make a copy of sim.tar.gz   
- then in the new sim folder, there is a generate, run, and job script   
    - the job script is for running jobs on a cluster with a PBS(?) queue
- the generate/run scripts will run a simulation and produce data
    - for fixed ordered runs, analysis files can be placed in the FixedOrderAnalysis directory and then specify which file to run in Cards/FO_analyze.dat
- TODO: scripts to move data from sim to data folders
- then scripts can be ran to present the data files differently