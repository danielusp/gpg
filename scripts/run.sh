#!/bin/bash
VERSION='0.1.0'

########################################
#
#   Build image and run container
#
########################################
echo "build GPG image"
docker build -t gpg:$VERSION .

if [[ $(docker ps --filter name=gpg-running -q) ]]; then
    echo "Stopping previous container"
    docker stop gpg-running
fi

echo "Running a new GPG container"

# Run container and keep it alive
docker run -d -it --rm --name gpg-running -v ${PWD}:/output gpg:$VERSION /bin/bash

########################################
#
#   Handle with GPG key
#
########################################
if [[ $(ls gpg_keys | grep ^backupkeys.pgp$) ]]; then
    echo "Importing gpg keys"
    docker exec -it gpg-running gpg --import gpg_keys/backupkeys.pgp
fi

# List GPG keys
docker exec -it gpg-running gpg --list-keys