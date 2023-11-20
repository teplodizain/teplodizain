resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "null_resource" "command1"
  provisiober "local-exec"{
    command = "echo Terraform START: $(data) >> log.txt"
}
}