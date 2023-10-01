
module "vpc" {
  source  = "gitlab.nexdev.net/iac-terraform/vpc/aws"
  version = "5.1.0"
  name    = "${var.environment}-${var.project}-vpc"
  cidr    = var.vpc_cidr
  azs     = var.vpc_availability_zones

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  # database_subnets = var.database_subnets
  # create_database_subnet_group = false
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
}
