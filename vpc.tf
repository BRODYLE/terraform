resource "alicloud_vpc" "vpc" {
  vpc_name          = "Demo-VPC"
  description       = "This is Test VPC"
  cidr_block        = "10.178.152.0/21"
  resource_group_id = alicloud_resource_manager_resource_group.demo-rg.id
  tags = {
    type       = "VPC-Demo"
    managed-by = "Terraform"
  }
}
 
#VSwich Definition 
resource "alicloud_vswitch" "vswitch-1" {
  cidr_block = "10.178.152.0/24"
  zone_id    = "ap-southeast-1a"
  vpc_id     = alicloud_vpc.vpc.id
  vswitch_name = "Demo-subnet-1"
  description = "Demo-subnet-1"
  tags = {
    type       = "development"
    managed-by = "Terraform"
  }
}
resource "alicloud_vswitch" "vswitch-2" {
  cidr_block = "10.178.153.0/24"
  zone_id    = "ap-southeast-1b"
  vpc_id     = alicloud_vpc.vpc.id
  vswitch_name = "demo-subnet-2"
  description = "demo-subnet-2"
  tags = {
    type       = "development"
    managed-by = "Terraform"
  }
}
resource "alicloud_vswitch" "vswitch-3" {
  cidr_block = "10.178.154.0/24"
  zone_id    = "ap-southeast-1c"
  vpc_id     = alicloud_vpc.vpc.id
  vswitch_name = "demo-subnet-3"
  description = "demo-subnet-3"
  tags = {
    type       = "development"
    managed-by = "Terraform"
  }
}



