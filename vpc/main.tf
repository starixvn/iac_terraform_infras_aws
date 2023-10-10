
module "vpc" {
  source  = "gitlab.nexdev.net/iac-terraform/vpc/aws"
  version = "5.1.0"
  name    = "${var.environment}-${var.project}-vpc"
  cidr    = var.vpc_cidr_block
  azs     = local.azs_sliced

  private_subnets = [
    for i in range(length(local.azs_sliced)) :
    cidrsubnet(var.vpc_cidr_block, var.vpc_cidr_subnetwork_width_delta, length(local.azs_sliced) + i)
  ]
  public_subnets = [
    for i in range(length(local.azs_sliced)) :
    cidrsubnet(var.vpc_cidr_block, var.vpc_cidr_subnetwork_width_delta, i)
  ]

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = false
  reuse_nat_ips          = true
  external_nat_ip_ids    = [aws_eip.nat_gw_elastic_ip.id]

  tags = merge(
    local.common_tags,
    {
      Resource  = "VPC"
      Workspace = "${terraform.workspace}"
    },
  )
}
