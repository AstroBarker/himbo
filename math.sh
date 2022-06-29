#!/bin/bash

# math functions. mostly wrappers around bc

# $1^$2
function Pow {
  if [ "$2" -eq 0 ] || [ "$1" == 1.0 ] || [ "$1" == 1 ]; then
    echo "1.0"
    exit
  elif [ "$1" == 0.0 ] || [ "$1" == 0 ]; then
    echo "0.0"
    exit
  else
    echo "scale=15;$1^$2" | bc
  fi
}

function Add {

}

function Subtract {
  # call add
}

function Mult {
  
}

function Div {

}

