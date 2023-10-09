
output "zones" {
  value = module.zones
}
output "result" {
  value = distinct(local.sg_domain_record_config)
}