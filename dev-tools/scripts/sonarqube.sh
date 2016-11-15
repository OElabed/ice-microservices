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

cd ../../ms/$MS_TYPE/$MS_NAME 

echo "================================================"
note "SonarQube : Start Static Analysis $MS_NAME ..."
echo "================================================"

./gradlew sonarqube -Dsonar.host.url=http://localhost:9000 -Dsonar.jdbc.url="jdbc:h2:tcp://localhost/sonar"

cd -

echo "================================================"
note "SonarQube : Finish Static Analysis $MS_NAME ..."
echo "================================================"

