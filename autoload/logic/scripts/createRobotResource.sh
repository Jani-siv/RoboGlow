#!/bin/bash

# Constants
vim_home=~/.vim/
#constants
syntax_file=$(find $vim_home -name resourceHighlight.vim | head -n 1)
# Sanity check
if [ $# -ne 1 ]; then
    echo "Usage: $0 <robot_file>"
    exit 1
fi

resource_file="$1"

# Check if the file exists
if [ ! -f "$resource_file" ]; then
    echo "File not found: $resource_file"
    exit 1
fi

# Create library name
# Extract the file name from the path
file_name="${resource_file##*/}"

# Remove the file extension (everything after the last dot)
res_name="${file_name%.*}"

# Check if library is already in definition file
cnt=$(grep -c $res_name $syntax_file)
if [ $cnt -ne 0 ]; then
#    echo "resource is already added"
    exit 0
fi

Keywords=$(grep -E "^[A-Za-z]" $resource_file | grep -v -E "Resource|Library" | cut -d"$" -f1)

IFS=$'\n' read -r -d '' -a keyword_array <<< "$Keywords"

LIBRARY=$(echo -n "syn match $res_name")
BEGIN='"\c\<\('
LIBRARY=$(echo -n "$LIBRARY     $BEGIN")

for func in "${keyword_array[@]}"; do
    LIBRARY=$(echo -n "$LIBRARY$func\\|")
done
# Edit end of LIBRARY
END=')\>"'
LIBRARY="${LIBRARY%|*}$END${LIBRARY##*|}"

# Write new library definition if not found
sed -i "/Resource/ a\\
$(printf '%s\n' "$LIBRARY" | sed -e 's/[\/&]/\\&/g')
" "$syntax_file"

# Add highlighting to library keywords
HIGHLIGHT="hi def link $res_name          Todo"
sed -i "/Links/ a\\
$(printf '%s\n' "$HIGHLIGHT" | sed -e 's/[\/&]/\\&/g')
" "$syntax_file"
