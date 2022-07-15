#!/bin/bash

source math.sh
source setup.sh
source utilities.sh

CFL=0.5
t=0.0
t_end=0.2

ComputeTimestep $CFL $dx $nx

iStep=0
iWrite=10
evolve=1
#evolution loop
while [ $evolve == 1 ]; do
  
  ComputeTimestep $CFL $dx $nx

  if [ $( echo "$t + $dt > $t_end" | bc -l ) == 1 ]; then
    dt=$t_end-$t
  fi

  if [ $( Eq $( expr $iStep % $iWrite ) 0 ) == 1 ]; then
    echo " ~ $iStep $t $dt"
  fi

  t=$( Add $t $dt )
  iStep=$( Add $iStep 1 )

  if [ $( echo "$t >= $t_end" | bc -l ) == 1 ]; then
    evolve=0
  fi
done
