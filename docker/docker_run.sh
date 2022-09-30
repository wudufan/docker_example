#!/bin/bash

# change the following variables to set up code, input and output dirs
HOST_WORK_DIR="/home/local/PARTNERS/dw640/docker_example"  # change this to your code directory
HOST_DATA_DIR="/home/local/PARTNERS/dw640/mnt/women_health_internal/DBT"  # change this to your data directory

# get host user id to populate to the container
HOST_USER_ID="$(id -u)"
HOST_GROUP_ID="$(id -g)"
HOST_USER_NAME=${USER}
CONTAINER_WORKDIR="/workspace/docker_example"

sudo docker run -it --runtime=nvidia --name=docker_ex --network="bridge" \
-v ${HOST_WORK_DIR}:${CONTAINER_WORKDIR} \
-v ${HOST_DATA_DIR}:"/mnt/data" \
-p 8112:8112 \
-e CONTAINER_UID=${HOST_USER_ID} \
-e CONTAINER_GID=${HOST_GROUP_ID} \
-e CONTAINER_UNAME=${HOST_USER_NAME} \
-e CONTAINER_WORKDIR=${CONTAINER_WORKDIR} \
docker_example:1.0.0
