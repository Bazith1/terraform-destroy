#!/bin/bash

# Navigate to the directory containing .tf files
cd "$(dirname "$0")"

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

# Validate Terraform files
echo "Validating Terraform files..."
terraform validate

# Plan Terraform deployment
echo "Planning Terraform deployment..."
terraform plan -out=tfplan

# Apply Terraform deployment
echo "Applying Terraform deployment..."
terraform apply -auto-approve tfplan

echo "Saving Terraform output to terraform-output.json..."
terraform output -json > ../terraform-output.json

echo "Terraform deployment completed. Output saved to terraform-output.json"