#!/bin/bash

set -x

if [ -f files/config.txt ]
then
    docker run -it --rm \
        --name xmr \
        -v $PWD/files/config.txt:/tmp/config.txt:ro \
        $USER/xmr
else
    echo "No config file found"
    exit 1
fi
