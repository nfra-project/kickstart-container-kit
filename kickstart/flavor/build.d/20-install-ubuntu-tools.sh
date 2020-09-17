#!/usr/bin/env bash

set -e

###
# Developer tools
#
# DOCKER_TAG is only availabe during build phase (defined in flavors dockerfile)
##

if [[ ${DOCKER_TAG} =~ \-min$ ]]
then
    echo "This is a '-min' build; Skipping developer features"
else
    apt-get install -y --no-install-recommends zip whois bash-completion locales

    # Install raw packages (reduce size)
    apt-get install -y --no-install-recommends git openssh-client vim pwgen telnet
    locale-gen en_US.UTF-8
fi;
# Packages that have less recommends


