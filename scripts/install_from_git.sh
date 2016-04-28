#!/bin/bash

# $1: Git repository.

MAINPATH=$(dirname $(cd `dirname "${BASH_SOURCE[0]}"` && pwd))
PROJECTNAME=$(basename $MAINPATH)

if [[ -z "$1" ]]; then
    echo "Usage: $0 [git repository]" >&2
    exit 1
fi

cd $MAINPATH
git clone $1 src

if [ -x src/setup.sh ];
then
    ./src/setup.sh
else
    ln -s ${MAINPATH}/src ${MAINPATH}/default
fi
