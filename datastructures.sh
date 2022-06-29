#!/bin/bash

# functions for using multi-D arrays

# $1 i
# $2 j
# $3 nx
function Index2D {
  echo "$(( $1 + $2*$3 ))"
}