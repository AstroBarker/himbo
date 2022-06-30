#!/bin/bash

# =========================
# Set up the test problem
# 
# Parameters
# $1 nx
# =========================

# --- Globals and such ---

PS3=" ~ Select a problem: "

ProblemList=("Sod" "Advection" "Other")

# --- Functions --- 

function Init {

  select problem in "${ProblemList[@]}"
  do
    case $problem in 
      Sod)
        echo " ~ Problem: Sod Shock Tube"
        ;;
      Other)
        echo " ! Problem Not Implemented"
        exit
    esac
    break
  done

}

# =======================
# Set up equidistant grid
#
# Parameters: 
# -----------
# $1 : nx
# =======================
function SetupGrid {
  echo " ~ Setting up grid with nx = $1"

  # declarations
  local xl; local xr
  local nx=$1

  # problems
  case $problem in 
    Sod)
      xl=0.0; xr=1.0
      echo "   ~ [xl,xr] = [$xl,$xr]"
      ;;
    Other)
      echo " ! Shouldnt be here"
      exit
  esac
  dx=$( echo "scale=15;($xr - $xl)/$nx" | bc )

  echo "   ~ Grid created"
}

# $1 : problem
function SetupProblem {
  echo " ~ Setting up $1"
  case $1 in 
    Sod)
      for ((i=0; i<nx; i++)); do
        if [ $i -le $(($nx/2)) ]; then
          urho[$i]=1.0
          um[$i]=0.0
          ue[$i]=2.5
        else
          urho[$i]=0.125
          um[$i]=0.0
          ue[$i]=0.25
        fi
      done
      ;;
    Other)
      ;;
  esac
}

# --- Body ---

if [ ! "$1" ]; then
  nx=100
  echo " ~ No dimensions passed, assumed nx = 100"
else
  nx=$1
fi

# --- Declarations ---
declare -a urho=(); for ((i=1; i<=nx; i++)); do urho+=(0.0); done
declare -a um=();   for ((i=1; i<=nx; i++)); do um+=(0.0);   done
declare -a ue=();   for ((i=1; i<=nx; i++)); do ue+=(0.0);   done
dx=0.0
# ---

# --- Body --- 
Init
SetupGrid $nx
SetupProblem $problem
echo " ~ Problem Initialization Complete!"
echo ""
