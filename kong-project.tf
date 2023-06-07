### Kong Project ###
module "kong" {
  source  = "./terraform-module-kong-hybrid"
  # version = "3.1.2" // first commit

  kong-image-tag                     = var.kong-image-tag
  kong-helm-version                  = var.kong-helm-version
  cluster-control-plane              = var.cluster-control-plane
  cluster-telemetry-endpoint         = var.cluster-telemetry-endpoint
  kong-tls-crt                       = var.kong-tls-crt
  kong-tls-key                       = var.kong-tls-key
  kong-cluster-cert-path             = var.kong-cluster-cert-path
  kong-namespace                     = var.kong-namespace
  service-monitor-enable             = var.service-monitor-enable
  service-monitor-namespace          = var.service-monitor-namespace
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"

    # host     = var.k8s-cluster-endpoint
    # client_certificate     = file("~/.kube/client-cert.pem")
    # client_key             = file("~/.kube/client-key.pem")
    # cluster_ca_certificate = file("~/.kube/cluster-ca-cert.pem")
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"

  # host     = var.k8s-cluster-endpoint
  # client_certificate     = file("~/.kube/client-cert.pem")
  # client_key             = file("~/.kube/client-key.pem")
   # cluster_ca_certificate = file("~/.kube/cluster-ca-cert.pem")
}