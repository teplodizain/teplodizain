resource "yandex_compute_disk" "test" {
  count = 3  
  name     = "test-${count.index}"
  size     = "16"
  type     = "network-ssd"
  zone     = "ru-central1-a"
  image_id = "fd8nru7hnggqhs9mkqps"

  labels = {
    environment = "test"
  }

}

resource "yandex_compute_instance" "test_instance" {

name = "vm"
platform_id = "standard-v3"
zone = "ru-central1-a"
allow_stopping_for_update = "true"

resources {
cores = 2
memory = 2
}

boot_disk {
initialize_params {
image_id = "fd8g64rcu9fq5kpfqls0"
}
}

  dynamic secondary_disk {
    for_each = "${yandex_compute_disk.test.*.id}"


    content {
      disk_id = yandex_compute_disk.test["${secondary_disk.key}"].id
    }
}

  network_interface {
    subnet_id = "${yandex_vpc_subnet.foo.id}"
  }

}


locals {
  ssh-keys = file("~/.ssh/id_rsa.pub")
}


resource "yandex_vpc_network" "foo" {}

resource "yandex_vpc_subnet" "foo" {
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.foo.id}"
  v4_cidr_blocks = ["10.5.0.0/24"]
}


output "one_vm" {
  value = yandex_compute_disk.test.*.id
}

output "two_vm" {
  value = yandex_compute_disk.test.1.id
}
/*
output "three_vm" {
  value = yandex_compute_disk.test.*

}
*/