#!/bin/bash

APP_VERSION="0.0.1"
WEB_VERSION="0.0.1"

mkdir -p ~/.opi/db

docker network create opi-net

docker run --name=opi-mongo -v ~/.opi/db:/data/db --network=opi-net -d mongo

docker run --name=opi-app -p 8081:8080 --network=opi-net --env-file ./.env -d ivorobioff/opi-app:$APP_VERSION
docker run --name=opi-web -p 4201:4200 --network=opi-net -d ivorobioff/opi-web:$WEB_VERSION

docker cp ./env.js opi-web:/src/opi-web/build/

echo 'Installed!';
