#!/bin/bash
source ./conf
REPO_PATH=$1
CURR_DIR=$(pwd)

# Build docker image
printf "\nDo you want to build a new $BACKEND_SERVER_NAME image (any previous $BACKEND_SERVER_NAME container will be stopped and deleted)? Type 'y' or 'n' and press enter: "
read buildServer

if [[ $buildServer == "y" ]] || [[ $buildServer == "yes" ]]; then
    printf "Building new docker image.\n"
    sudo docker build --force-rm -t edmingle:latest -f ./dockerfiles/edmingle.Dockerfile .
fi

# Run docker container

if [[ $buildServer == "y" ]] || [[ $buildServer == "y" ]]; then
    runServer="y"
else
    printf "\nDo you want to run a new $BACKEND_SERVER_NAME container? Type 'y' or 'n' and press enter: "
    read runServer
fi

if [[ $runServer == "y" ]] || [[ $runServer == "y" ]]; then
    ./helpers/containerInit.sh $BACKEND_SERVER_NAME

    docker run \
    --privileged \
    --net $NETWORK_BRIDGE \
    --name $BACKEND_SERVER_NAME \
    -v $REPO_PATH/:/var/www/html/ \
    -v $REPO_PATH/edmingle_conf_dev/conf/:/var/app/conf/ \
    -p 80:80 \
    -d \
    -t edmingle
fi