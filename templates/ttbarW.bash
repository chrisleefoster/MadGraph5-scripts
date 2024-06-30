#!/bin/bash
tar xf sim.tar.gz
mv sim ../sims/
cd ../sims/
today=$(date +"%y_%m_%d")

number=0
fname=ttbarW$today
string=$fname

while [ -e "$fname" ]; do
    printf -v fname '%s-%02d' "$string" "$(( ++number ))"
done

mv sim $fname
