#!/usr/bin/env bash

ROOTPWD=${PWD}

cd .. && \

sudo rm -Rf src/main/resources/static/ && \

sudo mkdir src/main/resources/static/ && \

cd webapp/ && \

sudo ln -s ~/node_modules node_modules && \

sudo npm install && \

sudo bower install --allow-root && \

grunt compile && \

sudo cp -R application/* ../src/main/resources/static/ && \

sudo rm -Rf application/ build/ node_modules vendor/ && \

cd .. && \

./gradlew clean build && \

cd $ROOTPWD