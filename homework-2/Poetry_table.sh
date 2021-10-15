#!/bin/bash

# A message for the -h flag
if [[ $1 == "-h" ]]; then
	echo "Poetry_table.sh program generates a table that contains..."
	exit 0
fi

# Could not figure this out. Just printing students for now :(
awk 'BEGIN {print "Student_ID\tFavorite poem\tFirst_7_chars_of_poem" } {line=$0; if (substr($line,0,7) == "Student" || substr($line,0,7) == "student")  {print $line} }' $1
