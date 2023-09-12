#!/bin/bash
#
if [ $# -eq 1 ] ; then
	username=$1

	echo "Hello $username!"
else
	echo "Only one argument."
fi
echo "Number of arguments: $#."
