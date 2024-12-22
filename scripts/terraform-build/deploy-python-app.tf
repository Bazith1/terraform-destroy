# Terraform Null Resource to deploy Python app after EKS cluster creation
resource "null_resource" "deploy_python_app" {
  depends_on = [
    aws_eks_cluster.eks_cluster
  ]

  provisioner "local-exec" {
    command = "./deploy.sh ${local.cluster_name}"
  }
}
