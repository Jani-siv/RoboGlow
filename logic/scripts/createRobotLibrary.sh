#!/bin/bash

#constants
syntax_file="../../libraryHighlight.vim"

#Sanity check
if [ $# -ne 1 ]; then
    echo "Usage: $0 <python_file>"
    exit 1
fi

python_file="$1"

# Check if the file exists
if [ ! -f "$python_file" ]; then
    echo "File not found: $python_file"
    exit 1
fi

# Create library name

# Extract the file name from the path
file_name="${python_file##*/}"

# Remove the file extension (everything after the last dot)
library_name="${file_name%.*}"

# check if library is already in definition file
cnt=$(grep -c $library_name $syntax_file)
if [ $cnt -ne 0 ]; then
    exit 0
fi

# Get definitions from file
KEYWORDS=$(grep "def " $1 | grep -v -E "__init__|main" | sed -E 's/^\s*def\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*\(.*/\1/')
# Put all keyword to array
IFS=$'\n' read -r -d '' -a keyword_array <<< "$KEYWORDS"

# Generate LIBRARY begin part
LIBRARY=$(echo -n "syn match $library_name")
BEGIN='"\c\<\('
LIBRARY=$(echo -n "$LIBRARY     $BEGIN")

for func in "${keyword_array[@]}"; do
    LIBRARY=$(echo -n "$LIBRARY$func\\|")
done
# Edit end of LIBRARY
END=')\>"'
LIBRARY="${LIBRARY%|*}$END${LIBRARY##*|}"

# Write new library definition if not found
sed -i "/Library/ a\\
$(printf '%s\n' "$LIBRARY" | sed -e 's/[\/&]/\\&/g')
" "$syntax_file"

# Add highlighting to library keywords
HIGHLIGHT="hi def link $library_name          String"
sed -i "/Links/ a\\
$(printf '%s\n' "$HIGHLIGHT" | sed -e 's/[\/&]/\\&/g')
" "$syntax_file"

