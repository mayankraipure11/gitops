#!/bin/bash

echo "=========Building and Pushing App Message One Docker Image app-message-two:latest============"

cd ./app-message-2

docker build -t app-message-two:latest . --no-cache

docker tag app-message-two:latest mayankraipure/app-message-two:latest

docker push mayankraipure/app-message-two:latest