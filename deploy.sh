#!/usr/bin/env bash
set -x

git pull origin main
cp python.yaml ../docker-compose/
cp 0_Schema.sql ../mysql/db/

cd ../docker-compose
docker kill $(docker ps -q -a)
docker rm $(docker ps -q -a)
docker-compose -f python.yaml up --build --force-recreate

