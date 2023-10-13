resource "aws_s3_object" "certificate_artifacts_s3_objects_staging" {
  for_each = toset(["certificate_pem", "issuer_pem", "private_key_pem"])

  bucket  = var.aws_region_bucket_remote_state                          # TODO put your own S3 bucket, and create it before if necessary!
  key     = "ssl-certs/${var.environment}/${var.team}/staging/${var.base_domain}/${each.key}" # TODO set your own bucket path
  content = lookup(module.acme_certificate_staging, "${each.key}")
  tags = merge(
    local.common_tags,
    {
      Resource = "aws_s3"
    },
  )
}

resource "aws_s3_object" "certificate_artifacts_s3_objects_production" {
  for_each = toset(["certificate_pem", "issuer_pem", "private_key_pem"])

  bucket  = var.aws_region_bucket_remote_state                          # TODO put your own S3 bucket, and create it before if necessary!
  key     = "ssl-certs/${var.environment}/${var.team}/main/${var.base_domain_main}/${each.key}" # TODO set your own bucket path
  content = lookup(module.acme_certificate_production, "${each.key}")
  tags = merge(
    local.common_tags,
    {
      Resource = "aws_s3"
    },
  )
}
