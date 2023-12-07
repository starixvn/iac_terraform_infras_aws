# SG Output Values

output "private_web_sg" {
  value = module.private_web_sg.security_group_id
}

output "private_db_sg" {
  value = module.private_db_sg.security_group_id
}

output "lb_proxygw_sg" {
  value = module.lb_proxygw_sg.security_group_id
}

output "lb_tool_sg" {
  value = module.lb_tool_sg.security_group_id
}

