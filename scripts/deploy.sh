#!/bin/bash
set -e

echo "Authenticating to EKS..."
# Load Cluster Name from Terraform Outputs
CLUSTER_NAME=$(jq -r '.cluster_name.value' terraform-output.json)

# Authenticate with EKS Cluster
aws eks update-kubeconfig --region us-east-1 --name "$CLUSTER_NAME"

# Apply Kubernetes Manifests
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Deployment to cluster $CLUSTER_NAME complete!"


