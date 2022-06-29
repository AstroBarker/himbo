#!/bin/bash

# =========================
# Set up the test problem
# 
# Parameters
# $1 nx
# $2 ny
# =========================

# --- Globals and such ---

PS3=" ~ Select a problem: "

ProblemList=("ShockTube" "Advection" "Other")

# --- Functions --- 

function Init {

  select problem in "${ProblemList[@]}"
  do
    case $problem in 
      ShockTube)
        echo " ~ Setting up Sod shock tube"
        ;;
      Other)
        echo " ! Problem Not Implemented"
    esac
    break
  done

}

# =======================
# Set up equidistant grid
#
# Parameters: 
# -----------
# $1 nx
# $2 ny
# =======================
function SetupGrid {
  echo " ~ Setting up grid with (nx,ny) = ($1, $2)"

  # declarations
  local width
  local xl
  local xr
  local nx=$1
  local ny=$2

  # problems
  case $problem in 
    ShockTube)
      xl=0.0
      xr=1.0
      ;;
    Other)
      echo " ! Shouldnt be here"
  esac
  width=$( echo "scale=15;($xr - $xl)/$nx" | bc )
  grid+=("$(echo "$xl+$width" | bc)")

  for ((i=1; i<nx; i++)); do
    grid+=($( echo "$i*$width" | bc))
  done

  echo " ~ Grid created"
}

function SetupProblem {
  echo "SetupProblem Not yet implemented"
}

# --- Body ---

if [ ! "$1" ]; then
  nx=100
  ny=100
  echo " ~ No dimensions passed, assumed (nx,ny) = (100,100)\n"
else
  nx=$1
  ny=$2
fi

# --- Declarations ---
declare -a grid
# ---

# --- Body --- 
Init
SetupGrid 100 100
