project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-terrapin"
aws_region_key_remote_state    = "env:/testlab/vpc-terraform.tfstate"

################EC2
public_key_location = "key/id_rsa.pub"
private_key_location = "key/id_rsa"
###LUMI WEB
configuration = [
  {
    "application_name" : "vnteam-rdp-server-1",
    "instance_type" : "t3.micro",
    "ami" : "windows2022",
    "no_of_instances" : "1",
    "volume_type" : "gp3",
    "volume_size" : "30",
  },
  {
    "application_name" : "vnteam-ssh-server-1",
    "instance_type" : "t2.micro",
    "ami" : "ubuntu22",
    "no_of_instances" : "1",
    "volume_type" : "gp3",
    "volume_size" : "20",
  },
]
