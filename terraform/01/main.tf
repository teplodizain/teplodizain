terraform {
required_providers {
yandex = {
source = "yandex-cloud/yandex"
}
}
required_version = ">= 0.13"
}

provider "yandex" {
token  =  "y0_AgAAAAANiIzEAATuwQAAAADTghpE1uLKej_RQL2bUxaJ68sz2Blzb8w"
cloud_id  = "b1gq02vr1egiguh0o3hh"
folder_id = "b1gs8gks9evl3v7ufrrl"


}


resource "yandex_compute_instance" "default" {
  name        = "test"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {

    initialize_params {
      image_id = "fd8nru7hnggqhs9mkqps"
    }
  }

  network_interface {

    subnet_id = "${yandex_vpc_subnet.foo.id}"
  }

  metadata = {
    foo      = "bar"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

}

resource "yandex_vpc_network" "foo" {}

resource "yandex_vpc_subnet" "foo" {
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.foo.id}"
  v4_cidr_blocks = ["10.5.0.0/24"]
}