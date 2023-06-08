output "helm_deployment" {
  value       = helm_release.kong-enterprise-data-plane
  description = "The state of the helm deployment"
}