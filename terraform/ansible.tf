resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 40"
  }

  depends_on = [
    local_file.inventory
  ]
}

resource "null_resource" "nginx" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/prod.yml ../ansible/nginx.yml"
  }

  depends_on = [
    null_resource.wait
  ]
}

resource "null_resource" "db" {
  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory/prod.yml ../ansible/db.yml"
  }

  depends_on = [
    null_resource.wait
  ]
}