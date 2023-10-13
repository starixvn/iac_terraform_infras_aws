/*
module "acme_account_staging" {
  source = "gitlab.nexdev.net/iac-terraform/acme-certificate/aws//account"
  version = "3.0.3"
  email_address = var.dns_names_staging
  #acme_alias = "acme.staging"
}
*/
module "acme_certificate_staging" {
  #source                   = "gitlab.nexdev.net/iac-terraform/acme-certificate/aws//certificate"
  #version                  = "3.0.3"
  source                   = "./modules/acme_certificate_staging/certificate"
  acme_account_id          = acme_registration.staging_account_registration.id
  acme_account_private_key = acme_registration.staging_account_registration.account_key_pem
  base_domain              = var.base_domain
  base_domain_zone_id      = data.terraform_remote_state.route53_zone.outputs.route53_zone[var.base_domain].route53_zone_zone_id[var.base_domain]

}

module "acme_certificate_production" {
  source                   = "./modules/acme_certificate_staging/certificate"
  acme_account_id          = acme_registration.production_account_registration.id
  acme_account_private_key = acme_registration.production_account_registration.account_key_pem
  base_domain              = var.base_domain_main
  base_domain_zone_id      = data.terraform_remote_state.route53_zone.outputs.route53_zone[var.base_domain_main].route53_zone_zone_id[var.base_domain_main]

}
