#!/bin/sh

# Recupera el mayor numero de motores
#csvcut -d '^' -c nb_engines,model optd_aircraft.csv | sort -n -r | uniq -c | head -1

#csvcut -d '^' -c nb_engines,model optd_aircraft.csv | sort | unique 

# Recupera el modelo con 6 motores
csvsort -d '^' -c nb_engines optd_aircraft.csv | csvcut -c model | tail -1