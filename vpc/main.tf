
module "vpc" {
  source  = "gitlab.nexdev.net/iac-terraform/vpc/aws"
  version = "5.1.0"
  name    = "${var.environment}-${var.project}-vpc"
  cidr    = var.vpc_cidr_block
  azs     = local.azs_sliced

  private_subnets      = [
    for i in range(length(local.azs_sliced)):
    cidrsubnet(var.vpc_cidr_block, var.vpc_cidr_subnetwork_width_delta, length(local.azs_sliced) + i)
    ]
  public_subnets       = [
    for i in range(length(local.azs_sliced)):
    cidrsubnet(var.vpc_cidr_block, var.vpc_cidr_subnetwork_width_delta, i)
    ]
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

/*
  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
*/
}
