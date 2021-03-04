#!/bin/bash

gpg $1
fname=$( echo $1 | sed 's/\.gpg$//' )
tar xvf "$fname"