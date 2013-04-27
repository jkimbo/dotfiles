#!/bin/bash 
# Convert minutes into fraction of an hour

MINUTES=$1

echo "scale=3; $1/60" | bc
