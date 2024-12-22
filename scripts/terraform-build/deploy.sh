#!/bin/bash
set -e

# Get the cluster name from the argument
CLUSTER_NAME=$1
REGION="ap-south-1"

echo "Authenticating to EKS..."

# Authenticate with EKS Cluster using AWS CLI
aws eks update-kubeconfig --region $REGION --name "$CLUSTER_NAME"

# Apply Kubernetes Manifests for your Python Application
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Deployment to cluster $CLUSTER_NAME complete!"
