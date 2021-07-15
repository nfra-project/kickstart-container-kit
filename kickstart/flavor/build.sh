#!/usr/bin/env bash

set -Eeo pipefail


## Create kick config

mkdir /etc/kick_bashrc.d/
echo "WORKDIR=$WORKDIR" > /etc/kick_bashrc.d/workdir
echo "PATH=/kickstart/bin:\$WORKDIR/bin:$PATH" > /etc/kick_bashrc.d/path

dir="/kickstart/flavor/build.d/*.sh";
for file in $dir
do
    echo "Executing file $file"
    . $file
    mv $file $file.done
done

rm -rf /var/lib/apt/lists/*
rm -rf /root/.composer/cache/*



