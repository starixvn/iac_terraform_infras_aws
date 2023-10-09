project = "clouddemo"
aws_region = "ap-northeast-1"
team = "Lumi"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
##############VPC
vpc_cidr_block         = "10.6.0.0/16"
enable_nat_gateway = true
single_nat_gateway = true
###########
rudder_num_availability_zones = 2
