#!/bin/bash
set -e

# Install Terraform
if ! command -v terraform &> /dev/null; then
  curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip
  unzip /tmp/terraform.zip -d /usr/local/bin/
fi

# Initialize and Apply Terraform
cd eks-terraform
terraform init
terraform apply -auto-approve

terraform output -json > ../terraform-output.json