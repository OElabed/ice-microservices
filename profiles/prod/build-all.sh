#!/usr/bin/env bash

function note() {
    local GREEN NC
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    printf "\n${GREEN}$@  ${NC}\n" >&2
}

set -e

# Backing microservices build
cd ../../ms/backing/ice-auth-ms;               note "Building auth-ms..."; ./gradlew clean build; cd -
cd ../../ms/backing/ice-config-ms;             note "Building config-ms..."; ./gradlew clean build; cd -
cd ../../ms/backing/ice-discovery-ms;          note "Building discovery-ms..."; ./gradlew clean build; cd -
cd ../../ms/backing/ice-getway-ms;             note "Building getway-ms..."; ./gradlew clean build; cd -
cd ../../ms/backing/ice-hystrix-dashboard-ms;  note "Building hystrix-dashboard-ms..."; ./gradlew clean build; cd -

# Core microservices build
cd ../../ms/core/ice-common;                   note "Building common..."; ./gradlew clean build; cd -
cd ../../ms/core/ice-account-ms;               note "Building account-ms..."; ./gradlew clean build; cd -

# Composite microservices build

# FrontEnd apps build
cd ../../ms/frontend/ice-store-ui/scripts;     note "Building store-ui..."; ./build.sh; cd -