#!/usr/bin/env bash
set -x

git pull origin main

cd ../docker-compose
docker kill $(docker ps -q -a)

docker-compose -f python.yaml up --build --force-recreate
