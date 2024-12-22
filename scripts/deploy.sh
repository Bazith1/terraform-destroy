#!/bin/bash
set -e

# Authenticate with EKS
echo "Authenticating to EKS..."
aws eks update-kubeconfig --name "$1" --region ap-south-1

# Check if connection is successful
kubectl cluster-info

if [ $? -eq 0 ]; then
  # Deploy Python app if authentication is successful
  echo "Applying Kubernetes Manifests..."
  kubectl apply -f k8s/deployment.yaml
  kubectl apply -f k8s/service.yaml
  echo "Deployment completed."
else
  echo "Failed to authenticate with the EKS cluster."
  exit 1
fi
