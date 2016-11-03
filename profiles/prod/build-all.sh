#!/usr/bin/env bash

function note() {
    local GREEN NC
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    printf "\n${GREEN}$@  ${NC}\n" >&2
}

set -e

# Common things build
cd ../../ms/core/ice-common;                   note "Building common..."; ./gradlew clean build; cd -

# Core microservices build
cd ../../ms/core/ice-account-ms;               note "Building account-ms..."; ./gradlew clean build; cd -

# Business microservices build

# Customer microservices build
cd ../../ms/customer/ice-admin-backend-ms;     note "Building admin-backend-ms..."; ./gradlew clean build; cd -

# FrontEnd apps build
cd ../../ms/gui/ice-store-ui/scripts;     note "Building store-ui..."; ./build.sh; cd -

# Support microservices build
cd ../../ms/support/ice-auth-ms;               note "Building auth-ms..."; ./gradlew clean build; cd -
cd ../../ms/support/ice-config-ms;             note "Building config-ms..."; ./gradlew clean build; cd -
cd ../../ms/support/ice-discovery-ms;          note "Building discovery-ms..."; ./gradlew clean build; cd -
cd ../../ms/support/ice-getway-ms;             note "Building getway-ms..."; ./gradlew clean build; cd -
cd ../../ms/support/ice-hystrix-dashboard-ms;  note "Building hystrix-dashboard-ms..."; ./gradlew clean build; cd -

# Tools microservices build
cd ../../ms/tools/ice-admin-ms;               note "Building admin-ms..."; ./gradlew clean build; cd -