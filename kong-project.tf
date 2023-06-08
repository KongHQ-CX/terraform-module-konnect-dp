### Kong Project ###
module "kong" {
  source = "./terraform-module-konnect-dp"
  # version = "3.1.2" // first commit

  kong-image-tag             = var.kong-image-tag
  cluster-control-plane      = var.cluster-control-plane
  cluster-telemetry-endpoint = var.cluster-telemetry-endpoint
  kong-cluster-cert-path     = var.kong-cluster-cert-path
  kong-namespace             = var.kong-namespace
}

/*
data "aws_eks_cluster" "kong-eks-cluster" {
  name = "testantoine"
}

data "aws_eks_cluster_auth" "kong-eks-cluster" {
  name = "testantoine"
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