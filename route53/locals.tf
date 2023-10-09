locals {
  project     = var.project
  environment = var.environment
  team        = var.team
  common_tags = {
    Dept        = "VNTeam"
    Team        = local.team
    ManageBy    = "Terraform"
    Environment = local.environment
  }
}

locals {
  sg_domain_zone_config = [
    for zone in var.sg_domain_zones : {
      domain = "${zone.domain}"
    }
  ]

  domain_ns_config = [
    for ns_records in var.domain_ns_records : {
      zone_id = ns_records.zone_id
      name_servers = ns_records.name_servers
      name    = ns_records.name
      type    = ns_records.type
      ttl     = ns_records.ttl
    }
  ]
#####
/*
  sg_domain_record_config = {
    for x in var.sg_domain_records : "${x.name}" => x {
      zone_id = x.key
      name    = x.name
      type    = x.type
      record  = x.record
      ttl     = x.ttl
    }
}*/
sg_domain_record_config = flatten([
    for domain_zone, domain_info_record in var.sg_domain_records : [
      for info_record in domain_info_record : {
        #info_record  = info_record
        domain_zone = domain_zone
        record_name  = info_record.name
        record_value  = info_record.record
        record_ttl  = info_record.ttl
        record_type  = info_record.type
      }
    ]
  ])
}
// We need to Flatten it before using it
locals {
  domain_zone   = flatten(local.sg_domain_zone_config)
  domain_ns  = flatten(local.domain_ns_config)
  #domain_record = flatten(local.sg_domain_record_config)
}