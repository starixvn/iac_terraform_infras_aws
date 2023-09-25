# Define Local Values in Terraform
locals {
  project     = var.project
  team        = var.team
  environment = var.environment
  common_tags = {
    Dept        = "VNTeam"
    Team        = local.team
    Environment = local.environment
  }
}

locals {
    allowed_os = {
        "amazon": {owner: "amazon",       filter: "amzn2-ami-hvm*"},
        "suse":   {owner: "amazon",       filter: "*suse*"},
        "RHEL":   {owner: "amazon",       filter: "*RHEL*"},
        "ubuntu20": {owner: "amazon", filter: "*ubuntu-focal-20.04-amd64-server-20230328"},
        "ubuntu22": {owner: "amazon", filter: "*ubuntu-jammy-22.04-amd64-server-20230728"},
        "windows2019": {owner: "amazon", filter: "Windows_Server-2019-English-Full-Base*"},
        "windows2022": {owner: "amazon", filter: "Windows_Server-2022-English-Full-Base*"},
    }
}

data "aws_ami" "os" {
  for_each = local.allowed_os

  most_recent = true
  owners      = [each.value.owner]
  filter {
    name   = "name"
    values = [each.value.filter]
  }
}

locals {
  serverconfig = [
    for srv in var.configuration : [
      for i in range(1, srv.no_of_instances+1) : {
        instance_name = "${srv.application_name}" #-${i}
        instance_type = srv.instance_type
        volume_type = srv.volume_type
        volume_size = srv.volume_size
        # subnet_id   = srv.subnet_id
        ami = srv.ami
        # security_groups = srv.vpc_security_group_ids
      }
    ]
  ]
}
// We need to Flatten it before using it
locals {
  instances = flatten(local.serverconfig)
}