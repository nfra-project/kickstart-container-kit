#!/usr/bin/env bash

set -e

# Packages that have less recommends
apt-get install -y --no-install-recommends zip whois bash-completion locales

# Install raw packages (reduce size)
apt-get install -y --no-install-recommends git openssh-client vim pwgen

locale-gen en_US.UTF-8