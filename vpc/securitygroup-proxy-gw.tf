# Security Group for Public Bastion Host
module "proxy_gw_sg" {
  source      = "gitlab.nexdev.net/iac-terraform/security-group/aws"
  version     = "5.0.0"
  name        = lower("${var.team}-${var.environment}-proxy-gw-sg")
  description = "Security Group with SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "http-8080-tcp", "all-icmp", "https-443-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block] #["0.0.0.0/0"] # Required for NLB
  egress_rules        = ["all-all"]
  tags = merge(
    local.common_tags,
    {
      Resource = "proxy_gw_sg"
    },
  )
}
