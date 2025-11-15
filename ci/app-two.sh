#!/bin/bash

echo "=========Building and Pushing App Message One Docker Image app-message-two:latest============"

cd ./app-message-2

APP_VERSION=$(grep "__version__" version.py | cut -d '"' -f 2)

docker build -t app-message-two:$APP_VERSION . --no-cache

docker tag app-message-two:$APP_VERSION mayankraipure/app-message-two:$APP_VERSION

docker push mayankraipure/app-message-two:$APP_VERSION