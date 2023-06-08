output "kong_deployment" {
  value       = module.kong.helm_deployment.status
  description = "The state of the kong module deployment"
}