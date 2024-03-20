locals {
  shared_domain = "${var.shared_sub_domain}.${var.my_domain}"
  dedicated_domain = "${var.dedicated_sub_domain}.${var.my_domain}"
}

resource "opentelekomcloud_dns_zone_v2" "this" {
  name        = var.my_domain 
  email       = var.my_email 
  description = "TF managed zone"
  ttl         = 300
  type        = "public"
}

resource "opentelekomcloud_dns_recordset_v2" "sdombi-dedicated" {
  zone_id     = opentelekomcloud_dns_zone_v2.this.id
  name        = local.dedicated_domain 
  description = "using dedicated lb"
  ttl         = 300
  type        = "A"
  records     = [opentelekomcloud_vpc_eip_v1.dedicated.publicip[0].ip_address]
}

# resource "opentelekomcloud_dns_recordset_v2" "sdombi-shared" {
  # zone_id     = opentelekomcloud_dns_zone_v2.this.id
  # name        = local.shared_domain
  # description = "using shared lb"
  # ttl         = 300
  # type        = "A"
  # records     = [opentelekomcloud_vpc_eip_v1.shared.publicip[0].ip_address]
# }
