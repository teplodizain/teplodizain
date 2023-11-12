/*resource "local_file" "ansible_inventory" {
  filename = "./inventory_test"
  content  = templatefile("${path.module}/inventory.tftpl", {
    webservers = yandex_compute_instance.web.*.public_ip
    databases  = yandex_compute_instance.vm.*.public_ip
    storage    = yandex_compute_instance.disk_vm.*.public_ip
  })
}
*/