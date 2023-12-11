######## ECS
resource "alicloud_instance" "instance" {
  security_groups = alicloud_security_group.SG1.*.id

  # series III
  instance_type           = "ecs.c5.large" # 2core 4GB
  system_disk_category    = "cloud_ssd"
  system_disk_name        = "system_disk"
  system_disk_size        = 40
  system_disk_description = "system_disk"
  image_id                = "centos_7_9_x64_20G_alibase_20230613.vhd"
  instance_name           = "test_ecs"
  password                = var.password
  instance_charge_type    = "PostPaid"
  vswitch_id              = alicloud_vswitch.vswitch-1.id
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "<html><body><h1>This is the Terraform Alicloud demo!</h1></body></html>" >> /var/www/html/index.html
              systemctl restart httpd
              EOF

  data_disks {
    name        = "disk2"
    size        = 100
    category    = "cloud_efficiency"
    description = "disk2"
  }
}

######## EIP bind to setup ECS accessing from internet
# Create a new EIP.
resource "alicloud_eip" "example" {
  bandwidth            = "10"
  internet_charge_type = "PayByBandwidth"
}

resource "alicloud_eip_association" "eip_ecs" {
  allocation_id = alicloud_eip.example.id
  instance_id   = alicloud_instance.instance.id
}



