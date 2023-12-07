
# SG for Web Application
module "private_web_sg" {
  source      = "gitlab.nexdev.net/iac-terraform/security-group/aws"
  version     = "5.0.0"
  name        = lower("${var.team}-${var.environment}-web-sg")
  description = "Open ports for Web Application"
  vpc_id      = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "prometheus-http-tcp", "all-icmp"]
  ingress_cidr_blocks = var.ingress_cidr_blocks
  egress_rules        = ["all-all"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 9001
      to_port     = 9001
      protocol    = 6
      description = "Allow Portainer"
      cidr_blocks = var.ingress_cidr_blocks
    },
    {
      from_port   = 8088
      to_port     = 8088
      protocol    = 6
      description = "Allow Port 8088"
      cidr_blocks = var.ingress_cidr_blocks
    },
    {
      from_port   = 22222
      to_port     = 22222
      protocol    = 6
      description = "Allow DeployAPI"
      cidr_blocks = var.ingress_cidr_blocks
    },
  ]
  tags = merge(
    local.common_tags,
    {
      Resource = "SG"
    },
  )
}

# SG for DB
module "private_db_sg" {
  source  = "gitlab.nexdev.net/iac-terraform/security-group/aws"
  version = "5.0.0"

  name        = "${var.environment}-${var.project}-db-sg"
  description = "Security Group for DB"
  vpc_id      = module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp","all-icmp"]
  # Ingress Rules & CIDR Blocks
  ingress_cidr_blocks = [var.ingress_cidr_blocks]
  ingress_with_cidr_blocks = [
    {
      from_port   = 27106
      to_port     = 27106
      protocol    = 6
      description = "Allow DB port 27106"
      cidr_blocks = var.ingress_cidr_blocks
    },
    {
      from_port   = 27107
      to_port     = 27107
      protocol    = 6
      description = "Allow DB port 27107"
      cidr_blocks = var.ingress_cidr_blocks
    },
    {
      from_port   = 27108
      to_port     = 27108
      protocol    = 6
      description = "Allow DB port 27108"
      cidr_blocks = var.ingress_cidr_blocks
    },
  ]
  egress_rules = ["all-all"]
  tags = merge(
    local.common_tags,
    {
      Resource = "SG"
    },
  )
}
