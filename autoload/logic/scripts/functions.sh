#!/bin/bash
# Helper functions for adding lib and res

AddDataToFile () {
    local Filename=$1
    local Data=$2
    local TagInFile=$3
    sed -i "/$TagInFile/ a\\
    $(printf '%s\n' "$Data" | sed -e 's/[\/&]/\\&/g')
    " "$Filename"
}
UpdateDataToFile () {
echo "will be updated soonish"
}
