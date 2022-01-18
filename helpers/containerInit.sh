#!/bin/bash
$CONTAINER_NAME=$1

if [[ $CONTAINER_NAME == "" ]]; then
	printf "Container name is empty. Exiting...\n"
	exit 1
fi

containerCheck=$(docker container ls | grep $CONTAINER_NAME)
if [[ $containerCheck == "" ]]; then
	printf "$CONTAINER_NAME container doesn't exists.\n"
else
	docker container stop edmingle-server
	docker container rm edmingle-server
	if [[ $? == 0 ]]; then
        printf "Error while removing $CONTAINER_NAME container.\n"
    fi
fi
