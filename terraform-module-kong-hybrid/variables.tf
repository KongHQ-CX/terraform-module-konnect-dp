variable "kong-image-tag" {
  type = string
} 

variable "cluster-control-plane" {
  type = string
}

variable "cluster-telemetry-endpoint" {
  type = string
}

variable "kong-helm-version" {
  type = string
}

variable "kong-tls-crt" {
  type = string
}

variable "kong-tls-key" {
  type = string
}

variable "service-monitor-enable" {
  type    = bool
  default = false
}

variable "service-monitor-namespace" {
  type = string
}

variable "kong-namespace" {
  type = string
}

variable "kong-cluster-cert-path" {
  type = string
}

variable "default-labels" {
  type = map(any)

  default = {
    "app.kubernetes.io/managed-by" : "Terraform"
  }
}

variable "additional-labels" {
  type = map(any)

  default = {}
}

variable "default-annotations" {
  type = map(any)

  default = {
    "app.kubernetes.io/managed-by" : "Terraform"
  }
}

variable "additional-annotations" {
  type = map(any)

  default = {}
}

