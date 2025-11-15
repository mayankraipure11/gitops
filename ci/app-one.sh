#!/bin/bash

echo "=========Building and Pushing App Message One Docker Image app-message-one:latest============"
cd ./app-message-1

APP_VERSION=$(grep "__version__" version.py | cut -d '"' -f 2)

docker build -t app-message-one:$APP_VERSION . --no-cache

docker tag app-message-one:$APP_VERSION mayankraipure/app-message-one:$APP_VERSION

docker push mayankraipure/app-message-one:$APP_VERSION