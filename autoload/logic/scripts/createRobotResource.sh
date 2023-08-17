#!/bin/bash
# You can modify colors here more highlight settings :highlight
included_resource_color="Todo"

# Add new library keywords and library name to syntax file
include_path="$(dirname "$0")"
source $include_path/functions.sh
# Constants
syntax_file=$include_path/../../../syntax/resourceHighlight.vim
keyword_array=()
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
#Check does file contain any keyword
isKey=$(grep -c "*** Keywords ***" $resource_file)
if [ $isKey -eq "0" ]; then
    exit 0
fi
# look key words only from *** Keywords *** to *** or EOF
in_section=0
# Read the input file line by line
while IFS= read -r line; do
    # Remove leading and trailing whitespace from the line
    trimmed_line=$(echo "$line" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

    # Check if the line starts with "*** Keywords ***"
    check_start=$(echo $trimmed_line | grep -c "*** Keywords ***")
    check_end=$(echo $trimmed_line | grep -c "***")
    if [[ $in_section -eq "1" && $check_end -eq "0" ]]; then
        in_section=0

    elif [[ $check_start -eq "1" ]]; then
        in_section=1
    fi

    # Process lines within the section
    if [[ $in_section -eq 1 ]]; then
        isKeyword=$(echo "$line" | grep -E "^[A-Za-z]" | grep -v " Keywords ")
        if [[ $isKeyword != "" ]]; then
            add_word=$(echo "$isKeyword" |  grep -E "^[A-Za-z]")
            keyword_array+=("$add_word")
        fi
    fi
done < "$resource_file"

LIBRARY=$(echo -n "syn match $res_name")
BEGIN='"\<\('
LIBRARY=$(echo -n "$LIBRARY     $BEGIN")

for func in "${keyword_array[@]}"; do
    LIBRARY=$(echo -n "$LIBRARY$func\\|")
done
# Edit end of LIBRARY
END=')\>"'
LIBRARY="${LIBRARY%|*}$END${LIBRARY##*|}"

R_RES='RoboGlow Resource'
R_LINK='RoboGlow Links'
HIGHLIGHT="hi def link $res_name          $included_resource_color"

AddDataToFile "$syntax_file" "$LIBRARY" "$R_RES"
AddDataToFile "$syntax_file" "$HIGHLIGHT" "$R_LINK"

