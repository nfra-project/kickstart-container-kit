#!/usr/bin/env bash

LOGNAME=$(basename $0)

function colorText() {
    local msg=$1;
    local fg=$2
    local bg=$3
    local tp=1;
    echo -e "\e[$bg;$tp;${fg}m$msg\e[0m";
}

function header() {
    local msg=$1;
    local fg=97; local tp=1; bg=44;
    echo -e "\e[$bg;$tp;${fg}m$msg\e[0m";
}

function debug() {
    (( $VERBOSITY < 7 )) && return;
    local msg=$1;
    local fg=37; local tp=0;
    echo -e "\e[$tp;${fg}m[$LOGNAME] $1\e[0m";
}

function info() {
    (( $VERBOSITY < 6 )) && return;
    local msg=$1;
    local fg=34; local tp=2;
    echo -e "\e[$tp;${fg}m[$LOGNAME] $1\e[0m";
}
function warn() {
    (( $VERBOSITY < 4 )) && return;
    local PROGNAME=$(basename $0)
    local msg=$1;
    local fg=33; local tp=2;
    echo -e "\e[$tp;${fg}m[$LOGNAME] $1\e[0m";
}
function emergency() {
    (( $VERBOSITY < 0 )) && return;
    local msg=$1;
    local fg=101; local tp=1; bg=44;
    echo -e "\e[$bg;$tp;${fg}m\n$msg\e[0m";
}