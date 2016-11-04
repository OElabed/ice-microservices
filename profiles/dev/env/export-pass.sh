#!/usr/bin/env bash

NUMBER_OF_APP="$(jq ". | length" micros.json)"

for i in `seq 1 $NUMBER_OF_APP`
do
    REGX_NAME=".["$i-1"] | .appname"
    PASS_MS_NAME="$(jq "$REGX_NAME" micros.json | tr -d '/"')_PASS"

    REGX_PASS=".["$i-1"] | .port"
    MS_PASS="$(jq "$REGX_PASS" micros.json | tr -d '/"')"

    export $PASS_MS_NAME=$MS_PASS

done