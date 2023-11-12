locals {

  test_list = ["develop", "staging", "production"]

  test_map = {
    admin = "John"
    user  = "Alex"
  }

  servers = {
    develop = {
      cpu   = 2
      ram   = 4
      image = "ubuntu-21-10"
      disks = ["vda", "vdb"]
    },
    stage = {
      cpu   = 4
      ram   = 8
      image = "ubuntu-20-04"
      disks = ["vda", "vdb"]
    },
    production = {
      cpu   = 10
      ram   = 40
      image = "ubuntu-20-04"
      disks = ["vda", "vdb", "vdc", "vdd"]
    }
  }
}

#John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks

/*
"${local.test_map["admin"]} is admin for ${local.test_list[2]} server on OS ${local.servers.stage.image} with ${local.servers.production.cpu} cpu  ${local.servers.production.ram} virtual disks"
"John is admin for production server on OS ubuntu-20-04 with ${"${local.test_map["admin"]} is admin for ${local.test_list[2]} server on OS ${local.servers.stage.image} with ${local.servers.production.cpu} cpu  ${local.servers.production.ram} virtual disks"
"John is admin for production server on OS ubuntu-20-04 with ${"${local.test_map["admin"]} is admin for ${local.test_list[2]} server on OS ${local.servers.stage.image} with ${local.servers.production.cpu} cpu  ${local.servers.production.ram} virtual disks"
"John is admin for production server on OS ubuntu-20-04 with 10 cpu  40 virtual disks"} cpu  40 virtual disks"} cpu  40 virtual disks"
*/