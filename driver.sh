#!/bin/bash

source math.sh
source setup.sh
source utilities.sh

CFL=0.5

ComputeTimestep $CFL $dx $nx
