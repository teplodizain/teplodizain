resource "yandex_compute_disk" "disk" {
  count    = 3
  name     = "disk-name-${count.index}"
  size     = "16"
  type     = "network-ssd"
  zone     = var.zone
  image_id = "fd8nru7hnggqhs9mkqps"

  labels = {
    environment = "test"
  }
}

resource "yandex_compute_instance" "storage" {
name = "vm-from-disks"
platform_id = "standard-v3"
zone = var.zone
allow_stopping_for_update = "true"

   resources {
    cores         = var.resources["cpu"]
    memory        = var.resources["ram"]
    core_fraction = var.resources["core_fraction"]
  }

boot_disk {
initialize_params {
image_id = "fd8g64rcu9fq5kpfqls0"
}
}

  dynamic secondary_disk {
   for_each = "${yandex_compute_disk.disk.*.id}"
   content {
        disk_id = yandex_compute_disk.disk["${secondary_disk.key}"].id
   }
}


  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }


  metadata = {
    serial-port-enable = 1
    ssh-keys           = "savchenko:${local.ssh-keys}"
  }

}
