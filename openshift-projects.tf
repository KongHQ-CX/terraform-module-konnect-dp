### OpenShift Projects ###
module "kong" {
  source  = "./terraform-module-kong-hybrid"
  version = "3.1.2"

  kong-image-tag                     = var.kong-image-tag
  kong-helm-version                  = var.kong-helm-version
  kong-tls-crt                       = var.kong-tls-crt
  kong-tls-key                       = var.kong-tls-key
  kong-cluster-cert-path             = var.kong-cluster-cert-path
  kong-namespace                     = var.kong-namespace
  service-monitor-enable             = var.service-monitor-enable
  service-monitor-namespace          = var.service-monitor-namespace
}