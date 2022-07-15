#!/bin/bash

# CFL dx nx
function ComputeTimestep {
  if [ $( Eq "$#" 3 ) -ne 1 ]; then
    echo " ! Wrong number of args to ComputeTimestep"
    exit
  fi

  local vmin=$( Div ${um[0]} ${urho[0]} )
  for ((i=0; i<$3; i++)); do
    local v=$( Div ${um[$i]} ${urho[$i]} )
    if [ "$( echo "$v < $vmin" | bc )" == 1 ]; then
      vmin=$v
    fi
  done

  if [ $( Eq $vmin 0 ) == 0 ]; then
    dt=$( Mult $1 $( Div $2 vmin ) )
  else
    dt=0.001
  fi
}
