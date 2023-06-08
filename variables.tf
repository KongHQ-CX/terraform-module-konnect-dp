variable "kong-image-tag" {
  type = string
}

variable "kong-helm-version" {
  type = string
  default = "2.23.0"
}

variable "kong-tls-crt" {
  type = string
  default = "tls.crt"
}

variable "kong-tls-key" {
  type = string
  default = "tls.key"
}

variable "kong-values-file" {
  type    = string
  default = "noexist.yaml"
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

