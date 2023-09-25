variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "aws_profile" {
  description = "aws profile"
  type        = string
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

# VPC CIDR Block
variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}

# VPC Availability Zones
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type        = list(string)
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
}

variable "enable_nat_gateway" {
  type = string
}
variable "single_nat_gateway" {
  type = string
}

variable "project" {
  type = string
}
