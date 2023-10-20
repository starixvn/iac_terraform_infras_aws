output "staging_account_registration_url" {
  value = acme_registration.staging_account_registration.registration_url
}


output "certificate_pem_staging" {
  description = "The certificate in PEM format."
  value       = module.acme_certificate_staging.certificate_pem
}

output "fullchain_pem_staging" {
  description = "The certificate concatenated with the intermediate certificate of the issuer."
  value       = module.acme_certificate_staging.fullchain_pem
}

output "issuer_pem_staging" {
  description = "The intermediate certificate of the issuer."
  value       = module.acme_certificate_staging.issuer_pem
}

output "private_key_pem_staging" {
  description = "The requested ACME certificate private key"
  value       = module.acme_certificate_staging.private_key_pem
  sensitive = true
}
/*
output "production_account_registration_url" {
  value = acme_registration.production_account_registration.registration_url
}
output "aws_acm_certificate_main" {
  value = aws_acm_certificate.certificate_production.arn
}

output "aws_acm_certificate_staging" {
  value = aws_acm_certificate.certificate_staging.arn
}
*/