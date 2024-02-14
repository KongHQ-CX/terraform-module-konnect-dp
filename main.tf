locals {
  kubernetes-project-name          = "kong"
  kong-tls-crt                     = "${var.kong-cluster-cert-path}/${var.kong-tls-crt}"
  kong-tls-key                     = "${var.kong-cluster-cert-path}/${var.kong-tls-key}"
}

resource "helm_release" "kong-enterprise-data-plane" {
  name      = "kong-enterprise-data-plane"
  namespace = var.kong-namespace

  repository = "https://charts.konghq.com"
  chart      = "kong"
  version    = var.kong-helm-version

  values = [
    "${file(var.kong-values-file)}"
  ]

  set {
    name  = "image.tag"
    value = var.kong-image-tag
  }

  set {
    name  = "image.repository"
    value = var.kong-image-repository
  }

  depends_on = [
    kubernetes_secret.kong-cluster-cert
  ]
}

resource "kubernetes_secret" "kong-cluster-cert" {
  metadata {
    name      = "kong-cluster-cert"
    namespace = var.kong-namespace

    annotations = merge(var.default-annotations, var.additional-annotations)
    labels      = merge(var.default-labels, var.additional-labels)
  }

  data = {
    "tls.crt" = "${file(local.kong-tls-crt)}"
    "tls.key" = "${file(local.kong-tls-key)}"
  }

  type = "kubernetes.io/tls"
}
