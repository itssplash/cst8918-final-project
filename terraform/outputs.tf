output "network" {
  value = module.network
}
output "aks_test" {
  value = module.aks_test
}
output "aks_prod" {
  value = module.aks_prod
}
output "acr" {
  value = module.acr
  sensitive = true
}
output "redis_test" {
  value = module.redis_test
}
output "redis_prod" {
  value = module.redis_prod
}
