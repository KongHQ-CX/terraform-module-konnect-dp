### Kong Project ###
module "kong" {
  source  = "KongHQ-CX/konnect-dp/module"
  version = "0.0.3"

  kong-image-tag             = var.kong-image-tag
  kong-cluster-cert-path     = var.kong-cluster-cert-path
  kong-namespace             = var.kong-namespace
  kong-values-file           = "${path.module}/data-plane-values.yaml"
}

/*
data "aws_eks_cluster" "kong-eks-cluster" {
  name = "$cluster_name"
}

data "aws_eks_cluster_auth" "kong-eks-cluster" {
  name = "$cluster_name"
}

provider "aws" {
  region     = var.aws-region
  access_key = var.aws-access-key
  secret_key = var.aws-secret-key
  token      = var.aws-token
  profile    = var.aws-profile
}
*/

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"

    /*
    host                   = data.aws_eks_cluster.kong-eks-cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.kong-eks-cluster.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.kong-eks-cluster.token
    */
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  # config_context = "minikube"

  /*
  host                   = data.aws_eks_cluster.kong-eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.kong-eks-cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.kong-eks-cluster.token
  */
}