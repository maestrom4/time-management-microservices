#!/bin/bash

IMG_REGISTRY_DIR="../k8s/img-registry-deployment"

cd "$(dirname "$0")"

if [ -d "$IMG_REGISTRY_DIR" ]; then
  echo "Removing existing img-registry-deployment..."
  kubectl delete -f "$IMG_REGISTRY_DIR/service.yaml" --ignore-not-found
  kubectl delete -f "$IMG_REGISTRY_DIR/deployment.yaml" --ignore-not-found
  echo "Deploying img-registry-deployment to kube-system namespace..."
  kubectl apply -f "$IMG_REGISTRY_DIR/deployment.yaml"
  kubectl apply -f "$IMG_REGISTRY_DIR/service.yaml"
else
  echo "Directory for img-registry-deployment does not exist. Skipping its deployment."
fi

cd - > /dev/null
