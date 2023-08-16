#!/bin/bash
# You can modify colors here more highlight settings :highlight
included_lib_color="robotSettings"
python_keywords_color="String"

# Add new library keywords and library name to syntax file
include_path="$(dirname "$0")"
source $include_path/functions.sh
#TODO Add syntax file path relatively to include_path
vim_home=~/.vim/
#constants
RLIB='RoboGlow Library'
RLIBLINK='RoboGlow Links'
RPYLIB='RoboGlow Python Library'
RPYLINK='RoboGlow Python Links'
# Get syntax file
syntax_file=$include_path/../../../syntax/libraryHighlight.vim
#Sanity check
if [ $# -ne 1 ]; then
    echo "Usage: $0 <python_file>"
    exit 1
fi
# File where get all functions
python_file="$1"

# Create library name

# Extract the file name from the path
file_name="${python_file##*/}"

# Remove the file extension (everything after the last dot)
library_name="${file_name%.*}"
#Check if library is build in and return if it is
isBuildInLib=$(CheckBuildInLib $library_name)
if [ "$isBuildInLib" == "1" ]; then
    echo "Answer is 1"
    exit 0
fi
echo "Answer expected to be 0 == $isBuildInLib"
# Check if the file exists
if [ ! -f "$python_file" ]; then
    echo "File not found: $python_file"
    exit 1
fi

# check if library is already in definition file
cnt=$(grep -c $library_name $syntax_file)
if [ $cnt -ne 0 ]; then
    #TODO Future this need change that it will update if there is already same named library.
    exit 0
fi

# Get definitions from python file and exlude __init__ and main functions
KEYWORDS=$(grep "^[[:space:]]*[^[:space:]#]*def " $1 | grep -v -E "__init__|main" | sed -E 's/^\s*def\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*\(.*/\1/')
# Put all keyword to array
IFS=$'\n' read -r -d '' -a keyword_array <<< "$KEYWORDS"

# Generate Keywords from library
LIBRARY=$(echo -n "syn match $library_name")
BEGIN='"\<\('
LIBRARY=$(echo -n "$LIBRARY     $BEGIN")

for func in "${keyword_array[@]}"; do
    LIBRARY=$(echo -n "$LIBRARY$func\\|")
done
# Edit end of LIBRARY
END=')\>"'
LIBRARY="${LIBRARY%|*}$END${LIBRARY##*|}"
HIGHLIGHT="hi def link $library_name          $python_keywords_color"

# Generate library name highlight as library
LIB_NAME=$(echo -n "syn match PY_$library_name         $BEGIN$library_name\)\>.\"")
LIB_NAME_HIGH="hi def link PY_$library_name          $included_lib_color"

# Write new library definition if not found
AddDataToFile "$syntax_file" "$LIBRARY" "$RLIB"
AddDataToFile "$syntax_file" "$HIGHLIGHT" "$RLIBLINK"
AddDataToFile "$syntax_file" "$LIB_NAME" "$RPYLIB"
AddDataToFile "$syntax_file" "$LIB_NAME_HIGH" "$RPYLINK"

