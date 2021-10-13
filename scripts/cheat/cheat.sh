#!/bin/bash

#
# A simple command line cheat sheet utility.
# Add new cheat sheats to the same directory that this script is in, or
# set the CHEAT_DIR variable to control cheat sheat location.
#

# Variables
CHEAT_DIR=$(dirname "$0")

usage() {
    cat << EOF
usage: $0 [options] [cheatsheet]
This script provides a command line cheat sheet utility.
OPTIONS:
   -h      Show this message
   -l      List available cheat sheats (default)
   -e      Edit an existing cheat sheet or create a new cheat sheet
EOF
}

# List available cheat sheets
list() {
    cd ${CHEAT_DIR}
    ls -1
}

# Display a cheat sheet
sheet() {
    cd ${CHEAT_DIR}
    cat ${CHEATSHEET}
}

# Edit a cheat sheet
edit() {
    cd ${CHEAT_DIR}
    vi ${CHEATSHEET}
    exit
}

while getopts "hlsve:" option; do
    case "${option}"
    in
        h) 
            usage
            exit 0
            ;;
        l)
            list
            exit 0
            ;;
        s) CHEATSHEET=${OPTARG}
            sheet
            ;;
        e) CHEATSHEET=${OPTARG}
            edit
            ;;
        *)
            list
            exit 0
            ;;
    esac
done

if [[ ! -z $1 ]]; then
    CHEATSHEET=${1}
    sheet
fi


