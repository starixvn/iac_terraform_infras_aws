module "public_bastion" {
  source = "gitlab.nexdev.net/iac-terraform/ec2-instance/aws"
  version = "5.1.0"

  for_each = {for server in local.instances: server.instance_name =>  server}
  instance_type = each.value.instance_type
  name = "${local.project}-${each.key}"
  ami           = data.aws_ami.os[each.value.ami].id
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  associate_public_ip_address = true
  root_block_device = [{
  volume_type = each.value.volume_type
  volume_size = each.value.volume_size
  delete_on_termination = true
  }]
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 8
  }
  tags = local.common_tags
}
