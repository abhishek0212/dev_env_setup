#!/bin/bash
source ./conf
# Accept install path as a param
WORKSPACE_DIR=$1

# If no install path was specified, prompt for path
if [[ $WORKSPACE_DIR == "" ]]; then
	CURR_DIR=$(pwd)
	WORKSPACE_DIR=${CURR_DIR%/*}
fi
printf "\nChecking path: '$WORKSPACE_DIR'\n"
if [[ ! -d $WORKSPACE_DIR ]]; then
	printf "Path does not exist. Exiting...\n"
	exit 1
else
	printf "Path exist.\n"
fi

# Create network bridge
networkCheck=$(docker network ls | grep $NETWORK_BRIDGE)
if [[ $networkCheck == "" ]]; then
	printf "Creating network $NETWORK_BRIDGE ...\n"
	docker network create $NETWORK_BRIDGE
	if [[ $? != 0 ]]; then
		printf "Error creating network $NETWORK_BRIDGE. Exiting...\n"
		exit 1
	fi
else
	printf "Skipping... Network $NETWORK_BRIDGE already exits.\n"
fi