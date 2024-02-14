variable "kong-image-tag" {
  type    = string
  default = "3.3.0.0"
}

variable "kong-image-repository" {
  type        = string
  description = "Private ECR container-image repository to pull the Kong image from."
  default     = "123456789012.dkr.ecr.eu-west-1.amazonaws.com/kong-gateway"  # SAMPLE, replace this with your own
}

variable "kong-cluster-cert-path" {
  type    = string
  default = "../kong-cluster-cert"
}

variable "kong-namespace" {
  type    = string
  default = "kong"
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