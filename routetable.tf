
resource "alicloud_route_table" "rt3" {
  description      = "test-description"
  vpc_id           = alicloud_vpc.vpc.id
  route_table_name = "route-table-03"
  associate_type   = "VSwitch"
}

#alicloud_route_table_attachment
resource "alicloud_route_table_attachment" "attachment3" {
  vswitch_id     = alicloud_vswitch.vswitch-3.id
  route_table_id = alicloud_route_table.rt1.id
}

resource "alicloud_route_table" "rt1" {
  description      = "test-description"
  vpc_id           = alicloud_vpc.vpc.id
  route_table_name = "route-table-01"
  associate_type   = "VSwitch"
}

#alicloud_route_table_attachment
resource "alicloud_route_table_attachment" "attachment1" {
  vswitch_id     = alicloud_vswitch.vswitch-1.id
  route_table_id = alicloud_route_table.rt1.id
}