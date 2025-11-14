#!/bin/bash

echo "=========Building and Pushing App Message One Docker Image app-message-one:latest============"
cd ./app-message-1

docker build -t app-message-one:latest . --no-cache

docker tag app-message-one:latest mayankraipure/app-message-one:latest

docker push mayankraipure/app-message-one:latest