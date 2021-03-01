#!/bin/bash
docker run -it --rm -v ${PWD}:/output gpg bash /output/root/encrypts.sh $1 $2