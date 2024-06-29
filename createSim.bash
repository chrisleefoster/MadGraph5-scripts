#!/bin/bash

# open templates
cd templates/

# user is asked to select one of the scripts in /templates/
#   if a correct selection is made, that script is ran
#   otherwise, Error message is printed
echo Choose a template.
select file_name in *.bash;
do
    echo You picked $file_name \($REPLY\)
    if [ -n "$file_name" ]; then    
        ./$file_name
        echo New simulation folder added to /sims/
    else
        echo Please enter the number of an availble template. Try again.
    fi
    break;
done