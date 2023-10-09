module "records" {
  source   = "gitlab.nexdev.net/iac-terraform/aws-route53/aws//modules/records"
  version  = "2.10.2"
  for_each = { for zone,record in local.sg_domain_record_config : zone => record }
  zone_id  = module.zones.route53_zone_zone_id[each.value.domain_zone]
  records = [
    {
      name = each.value.record_name
      type = each.value.record_type
      ttl  = each.value.record_ttl
      records = [
        each.value.record_value,
      ]
    },
  ]

  depends_on = [module.zones]
}

module "ns_records" {
  source   = "gitlab.nexdev.net/iac-terraform/aws-route53/aws//modules/records"
  version  = "2.10.2"
  for_each = { for record in local.domain_ns : record.name => record }
  
  zone_id  = module.zones.route53_zone_zone_id[each.value.zone_id]
  records = [
    {
      name = each.value.name
      type = each.value.type
      ttl  = each.value.ttl
      records = module.zones.route53_zone_name_servers[each.value.name_servers]
    },
  ]

  depends_on = [module.zones]
}

