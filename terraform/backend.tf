terraform {
  backend "s3" {
    bucket = "my-terraform-statefile-backup-bucket"  # The S3 bucket to store the state file
    key    = "Terraform/terraform.tfstate"  # The path within the bucket (e.g., a folder structure)
    region = "ap-south-1"  # The AWS region where the bucket exists

    # Optionally, you can add encryption or versioning options
    encrypt = true  # Encrypt the state file
    acl      = "bucket-owner-full-control"  # Permissions for the state file
  }
}
