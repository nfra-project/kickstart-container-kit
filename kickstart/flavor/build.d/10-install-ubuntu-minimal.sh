#!/bin/bash

set -e

## The minimum installation to build the container
# (This will lead to missing stuff.)

export DEBIAN_FRONTEND=noninteractive
apt-get update


# Bug in Ubuntu18.04. You have to install tzdata standalone first!
apt-get install -y --no-install-recommends tzdata
apt-get install -y --no-install-recommends git sudo ca-certificates unzip openssh-client




# (whois: offers mkpasswd command)