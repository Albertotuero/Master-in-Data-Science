#!/bin/sh

# Calculates the number of aircrafts in optd_aircrafts.csv file with a specified number of engines
echo The number of aircrafts with $1 engines is 
csvcut -d '^' -c nb_engines,iata_code $2 | grep -e "^$1" | wc -l 