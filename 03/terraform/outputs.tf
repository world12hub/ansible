# --- IP трёх ВМ ---
output "clickhouse_public_ip" {
  value       = module.clickhouse.external_ip_address[0]
  description = "Публичный IP ClickHouse"
}

output "vector_public_ip" {
  value       = module.vector.external_ip_address[0]
  description = "Публичный IP Vector"
}

output "lighthouse_public_ip" {
  value       = module.lighthouse.external_ip_address[0]
  description = "Публичный IP Lighthouse"
}

output "clickhouse_internal_ip" {
  value       = module.clickhouse.internal_ip_address[0]
  description = "Внутренний IP ClickHouse"
}

output "vector_internal_ip" {
  value       = module.vector.internal_ip_address[0]
  description = "Внутренний IP Vector"
}

output "lighthouse_internal_ip" {
  value       = module.lighthouse.internal_ip_address[0]
  description = "Внутренний IP Lighthouse"
}

# --- Container Registry ---
output "registry_id" {
  value       = module.container_registry.registry_id
  description = "ID Container Registry"
}