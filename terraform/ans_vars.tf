resource "local_file" "inventory1" {
  content = <<-DOC
    # Ansible inventory containing variable values from Terraform.
    # Generated by Terraform.
    network_interface: "${yandex_compute_instance.vm-1.network_interface.0.nat_ip_address}"
  DOC
  filename = "../ansible/var.yml"
  


  depends_on = [
    yandex_compute_instance.vm-1
  ]
}