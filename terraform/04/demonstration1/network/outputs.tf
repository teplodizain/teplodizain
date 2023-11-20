
output "vpc_network" {
  value = yandex_vpc_network.develop.id
}

output "vpc_subnet" {
  value = yandex_vpc_subnet.develop.id
}

