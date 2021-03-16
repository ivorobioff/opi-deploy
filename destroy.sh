#!/bin/bash

docker container rm -f opi-mongo
docker container rm -f opi-web
docker container rm -f opi-app
docker network rm opi-net

echo 'Destroyed!';