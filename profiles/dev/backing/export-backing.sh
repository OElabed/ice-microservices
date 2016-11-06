#!/usr/bin/env bash

NUMBER_OF_APP="$(jq ". | length" backing/config-backing.json)"

for i in `seq 1 $NUMBER_OF_APP`
do
    REGX_NAME=".["$i-1"] | .name"

    REGX_PORT=".["$i-1"] | .port"
    MS_PORT="$(jq "$REGX_PORT" backing/config-backing.json | tr -d '/"')"
    PORT_MS_NAME="$(jq "$REGX_NAME" backing/config-backing.json | tr -d '/"')_PORT"

    export $PORT_MS_NAME=$MS_PORT

    REGX_HOST=".["$i-1"] | .host"
    MS_HOST="$(jq "$REGX_HOST" backing/config-backing.json | tr -d '/"')"
    HOST_MS_NAME="$(jq "$REGX_NAME" backing/config-backing.json | tr -d '/"')_HOST"

    export $HOST_MS_NAME=$MS_HOST

    REGX_PASS=".["$i-1"] | .password"
    MS_PASS="$(jq "$REGX_PASS" backing/config-backing.json | tr -d '/"')"
    PASS_MS_NAME="$(jq "$REGX_NAME" backing/config-backing.json | tr -d '/"')_PASSWORD"

    export $PASS_MS_NAME=$MS_PASS

    # REGX_URL=".["$i-1"] | .url"
    # MS_URL="$(jq "$REGX_URL" backing/config-backing.json | tr -d '/"')"
    # URL_MS_NAME="$(jq "$REGX_NAME" backing/config-backing.json | tr -d '/"')_URL"

    # export $URL_MS_NAME=$MS_URL
    # echo $MS_URL

done