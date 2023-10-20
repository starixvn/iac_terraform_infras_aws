resource "aws_acm_certificate" "certificate_staging" {
  certificate_body  = module.acme_certificate_staging.certificate_pem
  private_key       = module.acme_certificate_staging.private_key_pem
  certificate_chain = module.acme_certificate_staging.issuer_pem
  tags = merge(
    local.common_tags,
    {
      Resource = "aws_certificate"
    },
  )
}
/*
resource "aws_acm_certificate" "certificate_production" {
  certificate_body  = module.acme_certificate_production.certificate_pem
  private_key       = module.acme_certificate_production.private_key_pem
  certificate_chain = module.acme_certificate_production.issuer_pem
  tags = merge(
    local.common_tags,
    {
      Resource = "aws_certificate"
    },
  )
}
*/