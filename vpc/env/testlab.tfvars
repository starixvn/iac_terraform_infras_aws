project = "clouddemo"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
####VPC
vpc_cidr         = "20.0.0.0/16"
private_subnets  = ["20.0.1.0/24", "20.0.2.0/24", "20.0.3.0/24", "20.0.4.0/24", "20.0.5.0/24", "20.0.6.0/24"]
public_subnets   = ["20.0.101.0/24", "20.0.102.0/24"]
#database_subnets = ["20.0.7.0/24", "20.0.8.0/24"]
enable_nat_gateway = true
single_nat_gateway = true

vpc_availability_zones = ["ap-northeast-1a","ap-northeast-1a","ap-northeast-1a","ap-northeast-1a","ap-northeast-1a","ap-northeast-1c"]