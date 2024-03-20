data "opentelekomcloud_lb_flavor_v3" "elb_dedicated_L7_flavor" {
  name = "L7_flavor.elb.s1.small" 
}

resource "opentelekomcloud_vpc_eip_v1" "dedicated" {
  bandwidth {
    charge_mode = "traffic"
    name        = "eip"
    share_type  = "PER"
    size        = 100
  }

  publicip {
    type = "5_bgp"
  }
}

# resource "opentelekomcloud_vpc_eip_v1" "shared" {
  # bandwidth {
    # charge_mode = "traffic"
    # name        = "eip"
    # share_type  = "PER"
    # size        = 100
  # }
#
  # publicip {
    # type = "5_bgp"
  # }
# }
#
resource "opentelekomcloud_lb_loadbalancer_v3" "this" {
  name = var.elb_name
  router_id = var.vpc_id
  network_ids = [var.network_id]
  subnet_id = var.subnet_id
  availability_zones=["eu-de-01", "eu-de-02"]
  l7_flavor = data.opentelekomcloud_lb_flavor_v3.elb_dedicated_L7_flavor.id
  public_ip {
    id = opentelekomcloud_vpc_eip_v1.dedicated.id
  }
}

# resource "opentelekomcloud_lb_loadbalancer_v2" "this" {
  # name          = "${var.elb_name}-shared"
  # vip_subnet_id = var.subnet_id
# }
#
# resource "opentelekomcloud_networking_floatingip_associate_v2" "associate" {
  # floating_ip = opentelekomcloud_vpc_eip_v1.shared.publicip[0].ip_address
  # port_id     = opentelekomcloud_lb_loadbalancer_v2.this.vip_port_id
# }
#
output "dedicated_elb_id" {
  value = opentelekomcloud_lb_loadbalancer_v3.this.id
}

output "dedicated_elb_ip" {
  value = opentelekomcloud_vpc_eip_v1.dedicated.publicip[0].ip_address 
}

# output "shared_elb_id" {
  # value = opentelekomcloud_lb_loadbalancer_v2.this.id
# }
#
# output "shared_elb_ip" {
  # value = opentelekomcloud_vpc_eip_v1.shared.publicip[0].ip_address
# }
