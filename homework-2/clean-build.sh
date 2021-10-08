#!/bin/bash

# Check if the project name was passed
if [[ $# -eq 0 ]]; then
	echo "Need to give name of project, without extension"
	exit 1
fi

# Create the directory if it doesn't exist
if [[ ! -d ".build" ]]; then
	mkdir .build
fi

pdflatex $1.tex

# Keep only the .tex and .pdf files; send all else to .build
for fyle in $1.*; do
	if [[ $fyle != "$1.pdf" && $fyle != "$1.tex" ]]; then
		mv $fyle .build
	fi
done

