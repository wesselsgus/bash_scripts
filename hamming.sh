#!/usr/bin/env bash

error () {
    printf '%s\n' "$*"
    exit 1
}

main() {
    if [ $# -lt 2 ]; then
        error "Usage: hamming.sh <string1> <string2>"
    fi

    a=$1
    b=$2

    if [ ${#a} != ${#b} ]; then
    error "left and right strands must be of equal length"
    fi

    declare -i count
    for (( i = 0; i < ${#a}; i++ )); do
        [[ ${a:i:1} == "${b:i:1}" ]] || count+=1
    done
    printf '%d\n' "$count"
}    

main "$@"
