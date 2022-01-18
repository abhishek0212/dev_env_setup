#!/bin/bash

NETWORK_NAME=$1

networkCheck=$(docker network ls | grep $NETWORK_NAME)

if [[ $networkCheck == "" ]]; then
	printf "Fatal Error: network $NETWORK_BRIDGE doesn't exists.\n"
	exit 1
fi