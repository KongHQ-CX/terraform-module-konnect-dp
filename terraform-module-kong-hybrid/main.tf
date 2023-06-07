locals {
  kubernetes-project-name          = "kong"
  kong-tls-crt                     = "${var.kong-cluster-cert-path}/${var.kong-tls-crt}"
  kong-tls-key                     = "${var.kong-cluster-cert-path}/${var.kong-tls-key}"

  cluster_control_plane            = "${var.cluster-control-plane}:443"
  cluster_server_name              = "${var.cluster-control-plane}"
  cluster_telemetry_endpoint       = "${var.cluster-telemetry-endpoint}:443"
  cluster_telemetry_server_name    = "${var.cluster-telemetry-endpoint}"
}

resource "helm_release" "kong-enterprise-data-plane" {
  name      = "kong-enterprise-data-plane"
  namespace = var.kong-namespace

  repository = "https://charts.konghq.com"
  chart      = "kong"
  version    = var.kong-helm-version

  values = [
    "${file("${path.module}/data-plane-values.yaml")}"
  ]

  set {
    name  = "image.tag"
    value = var.kong-image-tag
  }

  set {
    name  = "env.cluster_control_plane"
    value = "${var.cluster-control-plane}:443"
  }

  set {
    name  = "env.cluster_server_name"
    value = "${var.cluster-control-plane}"
  }

  set {
    name  = "env.cluster_telemetry_endpoint"
    value = "${var.cluster-telemetry-endpoint}:443"
  }

  set {
    name  = "env.cluster_telemetry_server_name"
    value = "${var.cluster-telemetry-endpoint}"
  }
  
  set {
    name  = "serviceMonitor.enable"
    value = var.service-monitor-enable
  }

  set {
    name  = "serviceMonitor.namespace"
    value = var.service-monitor-namespace
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
