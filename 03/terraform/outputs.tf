output "web_public_ip" {
  value       = module.web_vm.external_ip_address[0]
  description = "Публичный IP web-ВМ (приложение)"
}

output "web_internal_ip" {
  value       = module.web_vm.internal_ip_address[0]
  description = "Внутренний IP web-ВМ"
}

output "web_fqdn" {
  value       = module.web_vm.fqdn[0]
  description = "FQDN web-ВМ"
}

output "mysql_cluster_id" {
  value       = module.mysql.cluster_id
  description = "ID кластера MySQL"
}

# output "mysql_host_fqdn" {
#   value = module.mysql.host_fqdn
# }

output "registry_id" {
  value       = module.container_registry.registry_id
  description = "ID Container Registry"
}

# output "cr_repository_name" {
#   value = module.container_registry.repository_name
# }

output "mysql_host_fqdn" {
  value       = module.mysql.host_fqdn
  description = "FQDN хоста MySQL для подключения приложения"
}