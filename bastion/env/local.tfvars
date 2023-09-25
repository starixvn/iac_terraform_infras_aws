project = "cloud"
team = "Lumi"
aws_region = "ap-east-1"
environment = "local"
aws_profile = "local-iac-terraform-ci"
aws_region_bucket_remote_state = "cloud-lumi-starix-tf-mosquito"
aws_region_key_remote_state    = "env:/local/vpc-terraform.tfstate"

################EC2
public_key_location = "key/id_rsa.pub"
private_key_location = "key/id_rsa"
###LUMI WEB
os_linux = "data.aws_ami.ubuntu22.id"
os_windows = "data.aws_ami.windows2022.id"
sc_web_instance_type = "t3.medium"
sc_web_volume_type = "gp3"
sc_web_volume_size = "20"
sc_web_instance_count = 1

sc_hap_instance_type = "t3.micro"
sc_hap_volume_type = "gp3"
sc_hap_volume_size = "20"
sc_hap_instance_count = 1

sc_web_ec2_private_ips = ["10.0.1.42","10.0.1.43","10.0.1.44","10.0.1.45"]
sc_hap_ec2_private_ips = ["10.0.1.102","10.0.1.103"]
test_web_ec2_private_ips = ["10.0.1.241","10.0.1.242","10.0.1.243"]

###LUMI DB
sc_db_instance_type = "t3.micro"
sc_db_instance_count = 1
sc_db_private_ips = ["10.0.1.200","10.0.1.201","10.0.1.202","10.0.1.203","10.0.1.204"]