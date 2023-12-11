resource "alicloud_security_group" "SG1" {
  name = "SG1"
  vpc_id = alicloud_vpc.vpc.id
}

resource "alicloud_security_group_rule" "https" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "443/443"
  priority          = 1
  security_group_id = alicloud_security_group.SG1.id
  cidr_ip           = "10.0.0.0/8"
  description       = "allow https only"
}

resource "alicloud_security_group" "SG2" {
  name = "SG2"
  vpc_id = alicloud_vpc.vpc.id
}
resource "alicloud_security_group_rule" "ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.SG2.id
  cidr_ip           = "10.0.0.0/8"
  description       = "allow ssh only"
}