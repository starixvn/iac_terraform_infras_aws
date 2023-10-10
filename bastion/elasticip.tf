# Create Elastic IP for Bastion Host
resource "aws_eip" "public_bastion_linux_eip" {
  depends_on = [module.public_bastion_linux]
  instance   = module.public_bastion_linux.vnteam-ssh-server-1.id
  vpc = true
  tags = {
    Name = "${var.environment}-${var.project}-bastion-nat-eip"
  }
}
