#!/bin/bash

# create helloswarm replicas
docker service create --replicas 1 --name helloswarm alpine:latest ping docker.com
# see how the service is doing
docker service ls
docker service inspect --pretty
# see where the service is running
docker service ps helloswarm
# changing the scale of the service
docker service scale helloswarm=5
# removing the demo
docker service rm helloswarm


# setting up a temporary registry
$ docker service create --name registry --publish published=5000,target=5000 registry:2

# build the images
docker-compose build
# push the images
docker-compose push

# deploy the application to swarm
docker stack deploy --compose-file docker-compose.yaml novistack
# check status
docker stack ps novistack

