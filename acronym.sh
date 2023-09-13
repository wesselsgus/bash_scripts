#!/bin/bash

i=$1
echo "$i" | tr -d "'" | tr -c '[:lower:][:upper:]' '\n' | cut -c 1 | tr '[:lower:]' '[:upper:]' | tr -d '\n'
