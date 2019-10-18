#!/bin/bash

# build the image
docker image build . -t myhelloworld:latest
# list the images
docker images
# or
docker image ls
# run the image
docker run --rm myhelloworld:latest
# or
docker container run --rm myhelloworld:latest

# build the second image
docker image build . -f Dockerfile.alpine -t myhelloworld:alpine
# list
docker images
# run the image
docker run --rm myhelloworld:alpine
# run the image interractively
docker run --rm -ti myhelloworld:alpine sh

