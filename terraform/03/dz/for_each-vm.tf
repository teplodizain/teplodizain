
# Задание 2.4
locals {
  ssh-keys = file("~/.ssh/id_rsa.pub")
}

resource "yandex_compute_instance" "for_each" {

# Задание 2.3
  depends_on = [yandex_compute_instance.count]

  for_each = {for env in var.wm_resources : env.vm_name => env}
  name = each.value.vm_name
  allow_stopping_for_update = true
  
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
}     
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

    scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [ 
      yandex_vpc_security_group.example.id
    ]
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh-keys}"
  }
}


