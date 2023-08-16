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

CheckBuildInLib () {
    local buildInLib=("BuildIn" "Collections" "DateTime" \
        "Dialogs" "OperatingSystem" "Process" "Remote" \
        "Screenshot" "String" "Telnet" "XML")
    local VarToCheck=$1
    local found="0"
    for val in "${buildInLib[@]}"; do
        if [ "$VarToCheck" == "$val" ]; then
            found=$(echo "1")
            break
        fi
    done
    echo $found
}

