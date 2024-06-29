# MadGraph5-scripts   
MadGraph5 scripts offers various scripts aiding in the automation of [MadGraph5_aMC@NLO](https://launchpad.net/mg5amcnlo). MG5 is a framework for calculating theoretical results of particle collisions. For more information on MG5 and how to install it, see my [setup guide (work-in-progress)](https://github.com/chrisleefoster/MadGraph5-setup).

This work is adapted from scripts utilized in producing the NLO/LO cross sections and distributions seen in [this paper](https://arxiv.org/abs/2312.00861). Below is a flow chart of the workflow.

![Workflow flowchart](images/mg5-flowchart.png)

MadGraph5 scripts provides methods of producing directories corresponding to particle productions (like $pp \rightarrow t \bar{t}$), where each directory contains scripts for automatically generating and running MG5 simulations. Additional scripts extract data of interest and presents it in data files. Those data files are then used to: calculate k-factors, create plots with xmgrace, and create LaTeX tables.  

## Creating Data
With MG5 installed and setup, you can start simulating particle collisions. You can start by adding simulations to `/sims/` by running `./createSim.sh`.

### createSim.sh
`createSim.sh` allows you select from available templates or create your own. The templates function by making a copy of `source.tar.gz` and editing variables in the source files.  

The sim directory contains 5 files:   
- `generate.sh`
- `generate_eW.sh`
- `run.sh`
- `analysis_HwU_distributions.f`
- `job`

Currently, the createTemplate method is recommended for beginners not familiar with all MG5 options. To get a full understanding of all available options it is recommended `./bin/mg5_aMC`

### Generation scripts
After creating the new sim folder, you can start a simulation by running `path/to/mg5/bin/mg5_aMC generate.sh`. If we want to include electroweak corrections we run `path/to/mg5/bin/mg5_aMC generate_eW.sh`.

#### HPC job
If you are running on a HPC cluster using TORQUE, you can run simulations by submitting the job file with `qsub job`. 

## Process Data
Once a simulation is done, the data of interest will be found in `simName/Events/run_01/MADatNLO.HwU`.   
TODO: create script for moving data? (it only takes one command to move to this might be unnecessary).

The two python scripts will pull the data we are interested in from the HwU file into a data file.   

Currently, for distributions, I copy and paste data from the HwU file into an excel spreadsheet for processing and converting to LaTeX.    
TODO: create script for processing distributions

TODO: create script for creating LaTeX tables

## Analyze Data
TODO: add file for calculating k-factors

TODO: create script for plotting in xmgrace
