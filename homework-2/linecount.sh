#!/bin/bash

# Declare variables that will contain total lines
declare -i total_lines=0

# Return 0 if no arguments are passed
if [[ $# -eq 0 ]]; then
	echo $total_lines
	exit 1
fi

function line_counter() {
	# Loop through all files and directories (hidden ones too while
	# avoiding . and ..)
	for file in $1/* $1/.[^.]*; do
		# If it's a file, increment the line count
		if [[ -f "$file" ]]; then
		#	echo "File: $file"
			total_lines+=$(wc -l < $file)
		elif [[ -d "$file" ]]; then
		# If it's a directory, apply the function recursively
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
