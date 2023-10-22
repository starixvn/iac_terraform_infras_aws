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

variable "aws_region_key_remote_state_zone" {
  type = string
}
#######ROUTE 53
variable "domain_a_records" {
  description = "A records"
  default     = [{}]
}
variable "domain_alias_records" {
  description = "Alias records"
  default     = [{}]
}
variable "domain_ns_records" {
  description = "domain ns records"
  default     = [{}]
}
######

variable "dns_names_staging" {
  description = "A list of DNS domain names to register the certificate for. The fist one is the cetificate's common name, the primary domain that the certificate will be recognized for."
  type        = list(string)
}

variable "dns_names_main" {
  description = "A list of DNS domain names to register the certificate for. The fist one is the cetificate's common name, the primary domain that the certificate will be recognized for."
  type        = list(string)
}
/*
variable "email_address" {
  description = "The contact email address for the account."
}
*/
variable "min_days_remaining" {
  description = "ration of a certificate before a renewal is attempted. A value of less than 0 means that the certificate will never be renewed."
  default     = 30
}

variable "recursive_nameservers" {
  description = "The recursive nameservers that will be used to check for propagation of the challenge record. Defaults to your system-configured DNS resolvers."
  default     = []
}

##########
variable "acme_email" {
  type = string
}

variable "acme_email_staging" {
  type = string
}

variable "domain_name" {
  type    = string
  default = "lumigame.com"
}

variable "base_domain" {
  type    = string
  default = "staging.lumigame.com"
}

variable "base_domain_main" {
  type    = string
  default = "lumigame.com"
}