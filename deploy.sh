#!/bin/bash
set -e

echo "Authenticating to EKS..."
aws eks update-kubeconfig --name <cluster-name> --region <region>

echo "Deploying Kubernetes resources..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Deployment complete!"

