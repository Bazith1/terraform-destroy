
resource "null_resource" "deploy_python_app" {
  depends_on = [
    module.eks,  # Ensure EKS cluster is created first
  ]

  provisioner "local-exec" {
    command = "./deploy.sh ${module.eks.cluster_name}"
  }
}
