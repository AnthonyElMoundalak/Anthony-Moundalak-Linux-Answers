#!/bin/bash

# Check if the path is provided
if [ -z "$1" ]; then
	echo "Error: No directory path provided."
  	exit 1
fi

# Save first argument in a variable
var="$1"

# Check if the path exist and is valid
if [ ! -e "$var" ] || [ ! -d "$var" ]; then
	echo "Error: $var is an invalid or missing directory paths"
	exit 1
fi

# Initiate variables to count
direc=0
regul=0
symbol=0

# Loop through the files
for i in "$var"/*
do
	# Check if the file is a directory and increment the variable
	if [ -d "$i" ]; then
		((direc++))
	# Check if the file is a regular file and increment the variable
	elif [ -f "$i" ]; then
		((regul++))
	# Check if the file is a symbolic link and increment the variable
	elif [ -L "$i" ]; then
		((symbol++))
	fi
done

# Display results
echo "Directories: $direc"
echo "Regular files: $regul"
echo "Symbolic links: $symbol"
