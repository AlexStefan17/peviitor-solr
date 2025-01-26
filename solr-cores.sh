#!/bin/bash

CORE_NAME=auth
CORE_NAME_2=jobs
CORE_NAME_3=logo
CONTAINER_NAME="solr-container"
SOLR_PORT=8983

docker run -d --name $CONTAINER_NAME -p $SOLR_PORT:8983 solr:latest

echo "Waiting for Solr to start..."
sleep 3

echo "Creating Solr cores"
docker exec -it $CONTAINER_NAME bin/solr create_core -c $CORE_NAME
docker exec -it $CONTAINER_NAME bin/solr create_core -c $CORE_NAME_2
docker exec -it $CONTAINER_NAME bin/solr create_core -c $CORE_NAME_3
