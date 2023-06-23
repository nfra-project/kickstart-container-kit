#!/usr/bin/env bash

LOGNAME=$(basename $0)

function colorText() {
    local msg=$1;
    local fg=$2
    local bg=$3
    local tp=1;

    if [[ $bg -ge 40 ]]; then
        ((tp=30+$fg))
        echo -e "\e[$tp;${bg}m$msg\e[0m";
    else
        echo -e "\e[$bg;$tp;${fg}m$msg\e[0m";
    fi
}

function header() {
    local msg=$1;
    local fg=97; local tp=1; bg=44;
    colorText "$msg" "$fg" "$bg"
}

function debug() {
    (( $VERBOSITY < 7 )) && return;
    local msg=$1;
    local fg=37; local tp=0;
    colorText "[$LOGNAME] $msg" "$fg" "0"
}

function info() {
    (( $VERBOSITY < 6 )) && return;
    local msg=$1;
    local fg=34; local tp=2;
    colorText "[$LOGNAME] $msg" "$fg" "0"
}

function warn() {
    (( $VERBOSITY < 4 )) && return;
    local PROGNAME=$(basename $0)
    local msg=$1;
    local fg=33; local tp=2;
    colorText "[$LOGNAME] $msg" "$fg" "0"
}

function emergency() {
    (( $VERBOSITY < 0 )) && return;
    local msg=$1;
    local fg=101; local tp=1; bg=44;
    colorText "\n$msg" "$fg" "$bg"
}
