project = "clouddemo"
team = "Lumi"
aws_region = "ap-northeast-1"
environment = "testlab"
aws_profile = "test-iac-terraform-ci"
aws_region_bucket_remote_state = "clouddemo-lumi-starix-tf-terrapin"
aws_region_key_remote_state    = "env:/testlab/vpc-terraform.tfstate"
##### ZONE
sg_domain_zones = [
  {
    "domain" : "luminetsoft.com",
  },
]

domain_ns_records = [
  {
    "zone_id" : "luminetsoft.com",
    "name_servers" : "staging.luminetsoft.com",
    "name" : "staging",
    "type" : "NS",
    "ttl" : "86400",
  },
]
##### RECORDS
sg_domain_records = {
  "luminetsoft.com" = [
    {
        "name" : "api",
        "type" : "A",
        "ttl" : "3600",
        "record" : "202.78.231.55",
    },
    {
        "name" : "games",
        "type" : "A",
        "ttl" : "3600",
        "record" : "202.78.231.54",
    },
  ],
  "staging.luminetsoft.com" = [
    {
        "name" : "api",
        "type" : "A",
        "ttl" : "3600",
        "record" : "202.78.231.57",
    },
    {
        "name" : "games",
        "type" : "A",
        "ttl" : "3600",
        "record" : "202.78.231.58",
    },
  ],
}

/*
sg_domain_records = [
  {
    "zone_id" : "luminetsoft.com",
    "name" : "api",
    "type" : "A",
    "ttl" : "3600",
    "record" : "202.78.231.55",
  },
  {
    "zone_id" : "luminetsoft.com",
    "name" : "games",
    "type" : "A",
    "ttl" : "3600",
    "record" : "202.78.231.54",
  },
  {
    "zone_id" : "staging.luminetsoft.com",
    "name" : "api",
    "type" : "A",
    "ttl" : "3600",
    "record" : "202.78.231.57",
  },
  {
    "zone_id" : "staging.luminetsoft.com",
    "name" : "games",
    "type" : "A",
    "ttl" : "3600",
    "record" : "202.78.231.57",
  },
]
*/
domains = "luminetsoft.com"
staging_domains = "staging.luminetsoft.com"