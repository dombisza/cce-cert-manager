variable "domain_name" {}

variable "ak_sk_security_token" {
  type        = string
  description = "Security Token for temporary AK/SK"
}

variable "region" {
  type    = string
}

variable "domain_id" {
  type = string
}

variable "my_domain" {
  type = string
}

variable "my_email" {
  type = string
}

variable "shared_sub_domain" {
  type = string
}

variable "dedicated_sub_domain" {
  type = string
}

variable "elb_name" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "network_id" {}

