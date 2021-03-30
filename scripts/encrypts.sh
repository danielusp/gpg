#!/bin/bash

# Symmetric encryption

# Clear name
if [ -z "$2" ]; then
    echo "-------[ Encrypting $1 as $1.tar.gz.gpg ]--------"
    fname=$( echo $1 | sed 's/\/$//' )
else
    echo "-------[ Encrypting $1 as $2.tar.gz.gpg ]--------"
    fname=$( echo $2 )
fi

# Pack a single file or a directory
tar -cf "$fname.tar.gz" $1

# Encrypts with password
gpg -c --cipher-algo AES256 "$fname.tar.gz"

# Removes .tar.gz
rm "$fname.tar.gz"

echo "-------[ Done ]--------"