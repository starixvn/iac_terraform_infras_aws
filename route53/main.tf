module "delegation_sets" {
  source  = "gitlab.nexdev.net/iac-terraform/aws-route53/aws//modules/delegation-sets"
  version = "2.10.2"

  delegation_sets = {
    "luminetsoft_set" = {
      reference_name = "luminetsoft_set"
    },
  }
  /*
  delegation_sets = {
    main = {}
  }*/
}

module "zones" {
  source  = "gitlab.nexdev.net/iac-terraform/aws-route53/aws//modules/zones"
  version = "2.10.2"

  zones = {
    "luminetsoft.com" = {
      comment = "luminetsoft.com (production)"
      tags = {
        Name = "luminetsoft.com"
      }
    },
    "staging.luminetsoft.com" = {
      comment = "staging.luminetsoft.com (staging)"
      #delegation_set_id = module.delegation_sets.route53_delegation_set_id["luminetsoft_set"]
      delegation_set_name_servers = module.delegation_sets.route53_delegation_set_name_servers["luminetsoft_set"]
      tags = {
        Name = "staging.luminetsoft.com"
      }
    }
  }

  tags = merge(
    local.common_tags,
    {
      Resource = "Route53"
    },
  )

  depends_on = [module.delegation_sets]
}
