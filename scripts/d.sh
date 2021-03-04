#!/bin/bash
docker run -it --rm -v ${PWD}:/output gpg bash /output/root/decrypts.sh $1