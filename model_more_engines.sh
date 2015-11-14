#!/bin/sh

# Read the greatest engine number
#csvcut -d '^' -c nb_engines,model optd_aircraft.csv | sort -n -r | uniq -c | head -1

#csvcut -d '^' -c nb_engines,model optd_aircraft.csv | sort | unique 

# Read the model with more engines
csvsort -d '^' -c nb_engines optd_aircraft.csv | csvcut -c model | tail -1

# Teacher solution
# csvsort -d '^' -r -c nb_engines optd_aircraft.csv | head -2 | csvcut -c model | tail -1