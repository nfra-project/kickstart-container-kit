#!/bin/bash

##
# In development mode: set the uid of the user 'user' to the same
# UID as provided from kickstart.sh (DEV_UID)

debug "Changing userid of 'user' to '$DEV_UID'"





usermod -u $DEV_UID user
find /home/user \
  -path /home/user/.agents -prune -o \
  -exec chown user {} +
export HOME=/home/user