variable "kong-image-tag" {
  type = string
  default = "3.3.0.0"
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

variable "kong-cluster-cert-path" {
  type = string

  default = "./kong-cluster-cert"
}

variable "kong-namespace" {
  type = string
}

variable "service-monitor-enable" {
  type    = bool
  default = false
}

variable "service-monitor-namespace" {
  type = string
}