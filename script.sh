#!/bin/bash

./ci/app-one.sh

./ci/app-two.sh


# helm install app-message-one cd/helm/app-message-one
# helm install app-message-two cd/helm/app-message-two
kubectl apply -f ./cd/manifests/


echo "=========Deployed All Manifests Successfully============"
# wait for 10 seconds

echo "Deployment app-message-2 waiting for deployment for max 300s."
kubectl wait --for=condition=Available deployment/app-message-2 --timeout=300s
echo "Deployment app-message-2 is now available."

kubectl port-forward service/app-message-2  8080:8080




