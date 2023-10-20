
provider "acme" {
  alias      = "staging"
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

provider "acme" {
  #alias      = "production"
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "staging_account_private_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "acme_registration" "staging_account_registration" {
  provider        = acme.staging
  account_key_pem = tls_private_key.staging_account_private_key.private_key_pem
  email_address   = var.acme_email_staging
}
/*
resource "tls_private_key" "production_account_private_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
  
}


resource "acme_registration" "production_account_registration" {
  #provider        = acme.production
  account_key_pem = tls_private_key.production_account_private_key.private_key_pem
  email_address   = var.acme_email

}
*/