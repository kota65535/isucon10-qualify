#!/usr/bin/env bash
set -x

git pull origin main
docker build .

cd ../docker-compose
docker kill $(docker ps -q -a)

docker-compose -f python.yaml up --force-recreate
