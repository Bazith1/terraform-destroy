#!/bin/bash
set -e

echo "Initializing Terraform..."
terraform init

echo "Validating Terraform files..."
terraform validate

echo "Planning Terraform deployment..."
terraform plan -out=tfplan

echo "Applying Terraform deployment..."
terraform apply -auto-approve tfplan

echo "Terraform execution completed successfully!"
