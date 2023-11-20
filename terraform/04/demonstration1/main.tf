terraform {
  required_providers {
#required_version = ">=0.13"
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
#  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}


module "network" {
  source = "./network"
  zone = "ru-central1-a"
  cidr = "10.0.1.0/24"
  env_name = "develop"
}


module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = "develop"
  network_id      = module.network.vpc_network  
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = [ module.network.vpc_subnet ]
  instance_name   = "web"
  instance_count  = 1
  image_family    = "ubuntu-2004-lts"
  public_ip       = true
  
  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
  }

}


#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
ssh-authorized-keys = file(var.ssh-authorized-keys[0])
}
}

