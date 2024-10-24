#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# - stop
$sudo docker container stop main_mariadb
$sudo docker container stop main_mssql
$sudo docker container stop main_mysql
$sudo docker container stop main_oracle
$sudo docker container stop main_portainer
$sudo docker container stop main_postgres
$sudo docker container stop main_tomcat
$sudo docker container stop main_alpine

# - remove
$sudo docker container rm main_mssql
$sudo docker container rm main_mariadb
$sudo docker container rm main_mysql
$sudo docker container rm main_oracle
$sudo docker container rm main_portainer
$sudo docker container rm main_postgres
$sudo docker container rm main_tomcat
$sudo docker container rm main_alpine
