#!/usr/bin/env bash

NUMBER_OF_APP="$(jq ". | length" micros.json)"

for i in `seq 1 $NUMBER_OF_APP`
do
    REGX_NAME=".["$i-1"] | .appname"
    VAR_MS_NAME="$(jq "$REGX_NAME" micros.json | tr -d '/"')_PORT"

    REGX_PORT=".["$i-1"] | .port"
    MS_PORT="$(jq "$REGX_PORT" micros.json | tr -d '/"')"

    export $VAR_MS_NAME=$MS_PORT

done