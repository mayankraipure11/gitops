#!/bin/bash

./ci/app-one.sh

./ci/app-two.sh


## Install flux CD CRDs and Controllers in existing kind cluster
./cd/fluxcd/install-flux.sh

kubectl create secret generic my-git-auth \
	          --from-literal=username=mayankraipure11 \
	          --from-literal=password=$GIT_SECRET_PAT \
          --namespace=flux-system

kubectl apply -f ./cd/fluxcd/resources/gitrepository-cnf.yaml

sleep 5
kubectl apply -f ./cd/fluxcd/resources/helrelease-cnf.yaml

sleep 5

# helm upgrade -i app-message-one cd/helm/parent-chart


echo "=========Deployed All Manifests Successfully============"
# wait for 10 seconds

echo "Deployment app-message-one-app-message-two waiting for deployment for max 300s."
kubectl wait --for=condition=Available deployment/app-message-app-message-two --timeout=300s
echo "Deployment app-message-one-app-message-two is now available."

if lsof -i :8080 > /dev/null; then
    echo "Port 8080 is already in use. Killing the process using it."
    lsof -ti :8080 | xargs kill -9
fi

if ! lsof -i :8080 > /dev/null; then
    kubectl port-forward service/app-message-app-message-two 8080:8080 &
else
    echo "Port 8080 is already in use."
fi

echo "Waiting for port-forward to establish..."
sleep 5
MSG="Hello From Local host"
echo "Input: $MSG"
curl -G --data-urlencode "msg=$MSG" http://localhost:8080/message




