#!/bin/bash

# ssh into master vm
vagrant ssh master
# initialize the swarm
docker swarm init --advertise-addr 192.168.33.11
# - this will print out the joining command
# or one-liner
vagrant ssh master -c "docker swarm init --advertise-addr 192.168.33.11"

# ssh into node1
vagrant ssh node1
# join the master swarm
docker swarm join \
    --token <token-from-master> \
    192.168.33.11:2377
# or one-liner
vagrant ssh node1 -c "docker swarm join --token <token-from-master> 192.168.33.11:2377"

# one-liner 4 node2
vagrant ssh node2 -c "docker swarm join --token <token-from-master> 192.168.33.11:2377"

# ssh into master vm
vagrant ssh master
# see nodes information
docker node ls

