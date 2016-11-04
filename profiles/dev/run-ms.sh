#!/usr/bin/env bash

function note() {
    local GREEN NC
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    printf "\n${GREEN}$@  ${NC}\n" >&2
}

while getopts ":t:m:" opt; do
  case $opt in
    m) MS_NAME="$OPTARG"
    ;;
    t) MS_TYPE="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done



source ./env/export-port.sh

cd ../../ms/$MS_TYPE/$MS_NAME 

echo "=========================="
note "Running $MS_NAME ..."
echo "==========================" 

./gradlew bootRun 

cd -

echo "=========================="
echo "Stop $MS_NAME ..."
echo "=========================="

