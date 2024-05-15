#!/bin/bash

# open templates
#tar xf templates.tar.gz
cd templates/

# ASK USER IF THEY WANT AN AVAILABLE TEMPLATE OR BLANK TEMPLATE
echo Choose a template.
select file_name in *;
do
    echo You picked $file_name \($REPLY\)
    echo New simulation folder added to /sims/
    ./$file_name
    break;
done

