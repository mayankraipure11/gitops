kubectl apply -f cd/fluxcd/flux-system.yaml


echo "Deployment source-controller waiting for deployment for max 300s."
kubectl wait --for=condition=Available deployment/source-controller -n flux-system --timeout=300s
echo "Deployment source-controller is now available."

echo "Deployment notification-controller waiting for deployment for max 300s."
kubectl wait --for=condition=Available deployment/notification-controller -n flux-system --timeout=300s
echo "Deployment notification-controller is now available."

echo "Deployment helm-controller waiting for deployment for max 300s."
kubectl wait --for=condition=Available deployment/helm-controller -n flux-system --timeout=300s
echo "Deployment helm-controller is now available."

