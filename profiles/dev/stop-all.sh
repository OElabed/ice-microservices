#!/usr/bin/env bash


function note() {
    local GREEN NC
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    printf "\n${GREEN}$@  ${NC}\n" >&2
}

set -e

NUMBER_OF_APP="$(jq ". | length" micros.json)"

#echo "${NUMBER_OF_APP}"

for i in `seq 1 $NUMBER_OF_APP`
do

    REGX_NAME=".["$i-1"] | .appname"
    MS_NAME="$(jq "$REGX_NAME" micros.json | tr -d '/"')"
    
    REGX_PORT=".["$i-1"] | .port"
    MS_PORT="$(jq "$REGX_PORT" micros.json | tr -d '/"')"
    
    REGX_HOST=".["$i-1"] | .host"
    MS_HOST="$(jq "$REGX_HOST" micros.json | tr -d '/"')"
   
    note "Stopping $MS_NAME ..." 
    
    curl -X POST $MS_HOST:$MS_PORT/shutdown
    
done