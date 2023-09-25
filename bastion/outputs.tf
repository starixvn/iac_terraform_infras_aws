output "public_bastion_sg" {
  value = {
    public_bastion_linux_sg  = module.public_bastion_linux_sg.security_group_id
    public_bastion_windows_sg  = module.public_bastion_windows_sg.security_group_id
  }
}