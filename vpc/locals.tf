locals {
  project     = var.project
  environment = var.environment
  common_tags = {
    Dept        = "VNTeam"
    Team        = "VNTeam"
    Environment = local.environment
  }
}