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
    
    REGX_TYPE=".["$i-1"] | .type"
    MS_TYPE="$(jq "$REGX_TYPE" micros.json | tr -d '/"')"
    
    REGX_PORT=".["$i-1"] | .port"
    MS_PORT="$(jq "$REGX_PORT" micros.json | tr -d '/"')"
    
    REGX_STRATUP_TIME=".["$i-1"] | .startup_time"
    MS_STRATUP_TIME="$(jq "$REGX_STRATUP_TIME" micros.json | tr -d '/"')"
   
    cd ../../ms/$MS_TYPE/$MS_NAME 
    
    note "Running $MS_NAME ..."

    sudo rm -Rf logs && mkdir logs
    touch logs/start-up.log
    
    ./gradlew bootRun >> ./log/start-up.log &
    
    cd -

    sleep $MS_STRATUP_TIME
    
    #echo "$MS_NAME // $MS_TYPE // $MS_PORT"
done

echo "Starting finished with success ..."
