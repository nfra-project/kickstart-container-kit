#!/bin/bash

set -e

## The minimum installation to build the container
# (This will lead to missing stuff.)

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y

# Bug in Ubuntu18.04. You have to install tzdata standalone first!
apt-get install -y --no-install-recommends tzdata
apt-get install -y --no-install-recommends curl sudo ca-certificates unzip git patch




# (whois: offers mkpasswd command)