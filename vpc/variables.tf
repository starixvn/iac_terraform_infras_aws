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
variable "vpc_cidr_block" {
  description = "The IP address range of the VPC in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27."
  type        = string
  default     = "10.6.0.0/16"
}

variable "vpc_cidr_subnetwork_width_delta" {
  description = "The difference between your network and subnetwork netmask; an /16 network and a /20 subnetwork would be 4."
  type        = number
  default     = 4
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

###########EKS
variable "rudder_disk_size_gb" {
  description = "Default disk size on each worker node. Used for logs and temporary storage."
  type        = string
  default     = "30"
}

variable "rudder_num_availability_zones" {
  description = "Number of availability zones to create the Rudder cluster. Set it to -1 to deploy in all AZs"
  type        = number
  default     = 1
}