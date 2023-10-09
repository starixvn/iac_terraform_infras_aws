variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "aws_profile" {
  description = "aws profile"
  type        = string
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
}

variable "team" {
  description = "Team name"
  type        = string
}

variable "project" {
  type = string
}
variable "aws_region_bucket_remote_state" {
  description = "aws_region_bucket"
  type        = string
}
variable "aws_region_key_remote_state" {
  description = "aws_region_key"
  type        = string
}
variable "domains" {
  type = string
}
variable "staging_domains" {
  type = string
}
variable "sg_domain_zones" {
  description = "domain_zones"
  default     = [{}]
}
variable "sg_domain_records" {
  description = "domain_records"
  default     = [{}]
}
variable "domain_ns_records" {
  description = "domain ns records"
  default     = [{}]
}
