#!/usr/bin/env bash

ROOTPWD=${PWD}

cd ../.. && \

./gradlew ice-store-ui:clean && \

cd ice-store-ui && \

sudo rm -Rf src/main/resources/static/* && \

cd webapp/ && \

sudo npm install && \

sudo bower install --allow-root && \

grunt compile && \

sudo cp -R application/* ../src/main/resources/static/ && \

sudo rm -Rf application/ build/ node_modules/ vendor/ && \

cd ../.. && \

./gradlew ice-store-ui:build && \

cd $ROOTPWD