variable "kong-image-tag" {
  type    = string
  default = "3.3.0.0"
}

variable "kong-cluster-cert-path" {
  type    = string
  default = "../kong-cluster-cert"
}

variable "kong-namespace" {
  type    = string
  default = "kong"
}

variable "cluster-control-plane" {
  type    = string
  default = "xxxxxx.eu.cp0.konghq.com"
}

variable "cluster-telemetry-endpoint" {
  type    = string
  default = "xxxxxx.eu.tp0.konghq.com"
}

variable "service-monitor-enable" {
  type    = bool
  default = true
}

variable "service-monitor-namespace" {
  type = string
  default = "monitoring"
}

/*
variable "aws-region" {
  type = string
  default = ""
}

variable "aws-access-key" {
  type = string
  default = ""
}

variable "aws-secret-key" {
  type = string
  default = ""
}

variable "aws-token" {
  type = string
  default = ""
}

variable "aws-profile" {
  type = string
  default = ""
}
*/