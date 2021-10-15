#!/bin/bash

declare -i total_lines=0

if [[ $# -eq 0 ]]; then
	echo $total_lines
	exit 1
fi

function line_counter() {
	for file in $1/* $1/.[^.]*; do
		if [[ -f "$file" ]]; then
		#	echo "File: $file"
			total_lines+=$(wc -l < $file)
		elif [[ -d "$file" ]]; then
		#	echo "Directory: $file"
			line_counter $file
		fi
	done
}

# Call line_counter in a for loop for each argument
#for (( i=1; i <= $#; i++)); do
for i in $*; do
	line_counter $i
done

echo "Total number of lines: $total_lines"
