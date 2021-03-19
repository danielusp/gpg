#!/bin/bash

docker exec -it gpg-running gpg --full-generate-key

docker exec -it gpg-running gpg --output /output/$1.bk.gpg --armor --export-secret-keys --export-options export-backup

mv $1.bk.gpg gpg_keys/