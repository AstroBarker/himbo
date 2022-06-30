#!/bin/bash

# math functions. mostly wrappers around bc

# use bc to address equality
# needed because bash equality struggles with interger - float comparison
function Eq {
  if [ $# -gt 2 ]; then
    echo " ! Too many args to Eq"
    exit
  fi
  echo "$1==$2" | bc
}

# $1^$2
function Pow {
  if [ $# -gt 2 ]; then
    echo " ! Too many args to Eq"
    exit
  fi

  if [ "$(Eq $2 0)" == 1 ] || [ "$(Eq $1 1)" == 1 ]; then
    echo "1.0"
    exit
  elif [ "$(Eq $1 0)" == 1 ]; then
    echo "0.0"
    exit
  else
    echo "scale=15;$1^$2" | bc
  fi
}

function Add {
  if [ $# -gt 2 ]; then
    echo " ! Too many args to Add"
    exit
  fi
  echo "scale=15;$1+$2" | bc
}

function Subtract {
  # call add
  if [ $# -gt 2 ]; then
    echo " ! Too many args to Subtract"
    exit
  fi
  echo "scale=15;$1-$2" | bc
}

function Mult {
  if [ $# -gt 2 ]; then
    echo " ! Too many args to Mult"
    exit
  fi
  echo "scale=15;$1*$2" | bc
}

function Div {
  if [ $# -gt 2 ]; then
    echo " ! Too many args to Div"
    exit
  fi
  if [ "$(Eq $2 0)" == 1 ]; then
    echo " ! You cannot divide by zero!!! Aborting..."
    exit
  fi
  echo "scale=15;$1/$2" | bc
}