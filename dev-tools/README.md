# DEV-TOOLS

This folder contains all tools that we need to make DevOps on development environment and visualisation tools. Ex: SonarQube, Docker UI, etc.

## SonarQube
### Install
To install SonarQube lunch next command:

```sh
$ docker-compose run sonarqube
```
### How to use : Static analysis
```sh
$ cd dev-tools/scripts 
$./sonarqube.sh -t <type-of-service> -m <name-of-service>
```
After static analysis fineshed with success, we access to sonarqube portal to see results. 

SONARQUBE URL :   [http://192.168.33.10:9000/](http://192.168.33.10:9000/)

## Docker UI Viewer

Add this plugin to your chrome webstore