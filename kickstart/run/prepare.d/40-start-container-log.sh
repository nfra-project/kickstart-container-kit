#!/bin/bash

set -e

##
# Create a fifo pipe in /dev/log and output all stuff ariving there
# to stdout
#


mkfifo -m 777 /dev/log

# Output stuff arriving at /dev/log
tail -f /dev/log &

