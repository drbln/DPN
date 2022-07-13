resource "yandex_compute_instance" "vm-5" {
  name = "gitlab"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8qps171vp141hl7g9l"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = false #Не присваивать внешний IP
    ip_address = "192.168.10.14"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}