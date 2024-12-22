#!/bin/bash
set -e

echo "Initializing Terraform..."
terraform init

echo "Applying Terraform configurations..."
terraform apply -auto-approve

echo "Terraform applied successfully!"
