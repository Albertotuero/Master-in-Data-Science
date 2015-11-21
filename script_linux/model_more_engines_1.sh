#!/bin/sh

# Get the max number of engines from the file optd_aircraft.csv without the csvsort command
echo nb_engines > _max_engines.csv                                                                   
csvcut -d '^' -c nb_engines optd_aircraft.csv | sort -n | uniq | tail -1 >> _max_engines.csv
csvjoin -d '^' --left -c nb_engines _max_engines.csv optd_aircraft.csv | csvcut -c model | tail -1
rm _max_engines.csv