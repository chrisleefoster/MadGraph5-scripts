#!/bin/bash

# unpack source files
tar xf source.tar.gz

###############################################
# TEMPLATE NAME                               #
# user inputs name, if the name exists a number is added to the end
echo Give the new template a name:
read template_name
string=$template_name
number=0
while [ -e "$template_name" ]; do
    printf -v fname '%s-%02d' "$string" "$(( ++number ))"
done
mv newTemplate/ $template_name/               #
cd $template_name/                            #
###############################################


###############################################
# MODEL SELECTION                             #
models=("sm" "loop_sm")
echo What model would you like to use?
select choice in "${models[@]}";
do 
    sed -i "s/var_model/$choice/" generate.sh 
    break
done                                          #
###############################################


###############################################
# INITIAL STATE PARTICLES                     #
initial_states=("p p")
echo What two particles are we colliding?
select choice in "${initial_states[@]}";
do 
    sed -i "s/var_initial_state/$choice/" generate.sh 
    break
done                                          #
###############################################


###############################################
# FINAL STATE PARTICLES                       #
final_states=("t t~")
echo Whats final state of the collision?
select choice in "${final_states[@]}"
do 
    sed -i "s/var_final_state/$choice/" generate.sh 
    break
done                                          #
###############################################


############################################### 
# TYPES OF CORRECTIONS                        #
corrections=("[QCD]" "[QCD QED]")
echo Which corrections should we include?
select choice in "${corrections[@]}"
do 
    sed -i "s/var_qcd_qed/$choice/" generate.sh 
    break
done                                          #
###############################################


###############################################
# ORDER OF CORRECTIONS                        #
orders=("LO" "NLO")
echo Order of Corrections?
select choice in "${orders[@]}"
do 
    sed -i "s/var_order/$choice/" generate.sh 
    break
done                                          #
###############################################


###############################################
#  ENERGY OF INITAL PARTICLE 1                #
energies=("4000" "6500" "6800")
echo Beam Energies?
select choice in "${energies[@]}"
do 
    sed -i "s/var_energy/$choice/" generate.sh 
    break
done                                          #
###############################################


###############################################
#  PRECISION                                  #
precisions=("0.01" "0.001" "0.0001")
echo Precision?
select choice in "${precisions[@]}"
do 
    sed -i "s/var_precision/$choice/" generate.sh 
    break
done                                          #
###############################################