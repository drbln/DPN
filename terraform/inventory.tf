resource "local_file" "inventory" {
  content = <<-DOC
    # Ansible inventory containing variable values from Terraform.
    # Generated by Terraform.
    [nginx]
    yandex_compute_instance.vm-1 ansible_ssh_host=${yandex_compute_instance.vm-1.network_interface.0.nat_ip_address} ansible_ssh_port=22
    
    [db1]
    yandex_compute_instance.vm-2 ansible_ssh_host=192.168.10.11 ansible_ssh_port=22
    [db1:vars]
    ansible_ssh_extra_args =-o ControlPersist=7200s -o ServerAliveInterval=60 -o StrictHostKeyChecking=no -J ubuntu@${yandex_compute_instance.vm-1.network_interface.0.nat_ip_address}
    DOC
  filename = "../ansible/inventory/prod.yml"



  depends_on = [
    yandex_compute_instance.vm-1
  ]
}
