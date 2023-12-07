##Proxy Gateway Security Groups
module "proxy_gw_sg" {
  source      = "gitlab.nexdev.net/iac-terraform/security-group/aws"
  version     = "5.0.0"
  name        = lower("${var.team}-${var.environment}-proxy-gw-sg")
  description = "Open ports for Proxy GW"
  vpc_id      = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "http-8080-tcp", "all-icmp", "https-443-tcp"]
  ingress_cidr_blocks = var.ingress_cidr_blocks
  egress_rules        = ["all-all"]
  tags = merge(
    local.common_tags,
    {
      Resource = "SG"
    },
  )
}