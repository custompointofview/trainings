#!/bin/bash

# pull a image
docker pull hello-world
# inspect the image
docker inspect image hello-world
# image history
docker image history hello-world
# run the image
docker run --rm hello-world
