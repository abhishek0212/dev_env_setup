#!/bin/bash

REPO_PATH=$1

# Checking repo path
if [[ $REPO_PATH == "" ]]; then
	CURR_DIR=$(pwd)
	REPO_PATH=${CURR_DIR%/*}
fi
printf "\nChecking path: '$REPO_PATH'..."
if [[ -d $REPO_PATH ]]; then
	printf "Path found.\n"
else
	printf "Path does not exist. Exiting.\n"
	exit 1
fi