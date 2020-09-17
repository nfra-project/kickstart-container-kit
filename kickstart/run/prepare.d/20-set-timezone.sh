#!/bin/bash

if [[ "$TIMEZONE"=="" ]]; then
    TIMEZONE="Europe/Berlin"
fi

info "Setting timezone to $TIMEZONE... (set env TIMEZONE if you want to change this)"
ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone
