#!/usr/bin/env bash

NUMBER_OF_APP="$(jq ". | length" micros/config-micros.json)"

for i in `seq 1 $NUMBER_OF_APP`
do
    REGX_NAME=".["$i-1"] | .appname"

    REGX_PORT=".["$i-1"] | .port"
    MS_PORT="$(jq "$REGX_PORT" micros/config-micros.json | tr -d '/"')"
    PORT_MS_NAME="$(jq "$REGX_NAME" micros/config-micros.json | tr -d '/"')_PORT"

    export $PORT_MS_NAME=$MS_PORT

    REGX_PASS=".["$i-1"] | .password"
    MS_PASS="$(jq "$REGX_PASS" micros/config-micros.json | tr -d '/"')"
    PASS_MS_NAME="$(jq "$REGX_NAME" micros/config-micros.json | tr -d '/"')_PASSWORD"

    export $PASS_MS_NAME=$MS_PASS

    REGX_URL=".["$i-1"] | .url"
    MS_URL="$(jq "$REGX_URL" micros/config-micros.json | sed 's:^.\(.*\).$:\1:')"
    URL_MS_NAME="$(jq "$REGX_NAME" micros/config-micros.json | tr -d '/"')_URL"

    export $URL_MS_NAME=$MS_URL

done