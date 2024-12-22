#!/bin/bash
set -e

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
terraform plan

# Apply Terraform deployment (if needed)
# echo "Applying Terraform deployment..."
# terraform apply -auto-approve
