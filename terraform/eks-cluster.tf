module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version
  subnet_ids      = module.vpc.private_subnets

  enable_irsa = true

  tags = {
    cluster = "demo"
  }

  vpc_id = module.vpc.vpc_id

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }

  eks_managed_node_groups = {

    node_group = {
      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }
  
 # vpc_config block with API server access settings
  cluster_endpoint_public_access = true  # Make the API server publicly accessible
  cluster_endpoint_private_access = true # Allow private access from within the VPC
}

 

module "fargate_profile" {
  source       = "terraform-aws-modules/eks/aws//modules/fargate-profile"
  name         = "separate-fargate-profile"
  cluster_name = local.cluster_name

  subnet_ids = module.vpc.private_subnets
  selectors = [{
    namespace = "kube-system"
  }]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }

  # Ensures Fargate profile creation waits for EKS cluster readiness
  depends_on = [module.eks]
}
