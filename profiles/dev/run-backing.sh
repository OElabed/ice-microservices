#!/usr/bin/env bash

function note() {
    local GREEN NC
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    printf "\n${GREEN}$@  ${NC}\n" >&2
}

while getopts ":t:b:" opt; do
  case $opt in
    b) BK_NAME="$OPTARG"
    ;;
    t) BK_TYPE="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done


source ./backing/export-backing.sh

cd backing 

echo "=========================="
note "Running $BK_NAME ..."
echo "==========================" 

docker-compose up $BK_NAME

cd -

echo "=========================="
echo "Stop $BK_NAME ..."
echo "=========================="

