project = "cloud"
team = "Lumi"
aws_region = "ap-east-1"
environment = "local"
aws_profile = "local-iac-terraform-ci"
aws_region_bucket_remote_state = "cloud-lumi-starix-tf-goshawk"
aws_region_key_remote_state    = "env:/local/vpc-terraform.tfstate"
aws_region_key_remote_state_zone    = "env:/local/route53-tf.tfstate"
############### Route53
domain_ns_records = [
  {
    "zone_id" : "lumigame.com",
    "name_servers" : "staging.lumigame.com",
    "name" : "staging",
    "type" : "NS",
    "ttl" : "86400",
  },
]

domain_a_records = {
  "lumigame.com" = [
    {
          "name" : "*",
          "type" : "A",
          "ttl" : "3600",
          "record" : "10.10.50.69",
    },
    {
          "name" : "nexops",
          "type" : "A",
          "ttl" : "3600",
          "record" : "202.78.231.55",
    },
  ],  
}


domain_alias_records = {
  "lumigame.com" = [
    {
        "name" : "w1",
        "type" : "A",
    },
    {
        "name" : "w2",
        "type" : "A",
    },
  ],
  "staging.lumigame.com" = [
    {
        "name" : "w1",
        "type" : "A",
    },
    {
        "name" : "w2",
        "type" : "A",
    },
  ],
}

dns_names_staging     = [
    "staging.lumigame.com",
    "*.staging.lumigame.com",
  ]

dns_names_main     = [
    "lumigame.com",
    "*.lumigame.com",
  ]
acme_email = "troy.vo@starixsoft.com"
acme_email_staging = "troy.vo@nexcel.vn"