terraform {
  required_version = "<=1.5.5, >=v1.4.6"
  # backend "s3" {
    # endpoint                    = "obs.eu-de.otc.t-systems.com"
    # bucket                      = "sdombi-loki-stack-tfstate-988db4ad"
    # kms_key_id                  = "097bd4fa-699a-41e9-abad-ae56e8ada31a"
    # key                         = "loki-stack/tfstate-cloud-service"
    # skip_region_validation      = true
    # skip_credentials_validation = true
    # region                      = "eu-de"
    # encrypt = true
   # }
   required_providers {
     opentelekomcloud = {
     source  = "opentelekomcloud/opentelekomcloud"
     version = ">=1.35.6"
     }
   }
}

