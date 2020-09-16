#!/bin/bash

##
# Load the environment from kick.yml and evaluate it
# So you can also extend like PATH or modify environment
# directly
#


envtoset=`/kickstart/bin/kick kick_to_env`
debug "kick_to_env raw: $envtoset"
## Evaluate and replace $PATH in envtoset

eval $envtoset

## Multiline needs to be evaled



