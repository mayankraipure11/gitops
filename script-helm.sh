#!/bin/bash

./ci/app-one.sh

./ci/app-two.sh


helm upgrade -i app-message-one cd/helm/app-message-one

helm upgrade -i app-message-two cd/helm/app-message-two
# kubectl apply -f ./cd/manifests/

echo "=========Deployed All Manifests Successfully============"
# wait for 10 seconds

echo "Deployment app-message-two waiting for deployment for max 300s."
kubectl wait --for=condition=Available deployment/app-message-two --timeout=300s
echo "Deployment app-message-two is now available."

if lsof -i :8080 > /dev/null; then
    echo "Port 8080 is already in use. Killing the process using it."
    lsof -ti :8080 | xargs kill -9
fi

if ! lsof -i :8080 > /dev/null; then
    kubectl port-forward service/app-message-two 8080:8080 &
else
    echo "Port 8080 is already in use."
fi

echo "Waiting for port-forward to establish..."
sleep 5
MSG="Hello From Local host"
echo "Input: $MSG"
curl -G --data-urlencode "msg=$MSG" http://localhost:8080/message




