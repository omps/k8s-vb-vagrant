terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

provider "virtualbox" {}

resource "virtualbox_vm" "ubuntu_vm" {
  name   = "terraform-ubuntu"
  cpus   = 2
  memory = "2048 mib"

  # Specify your local ISO using the required "image" argument.
  image = "file:///Users/omps/Downloads/ubuntu-24.04.2-live-server-amd64.iso"

  boot_order = ["dvd", "disk"]

  # Use cloud‑init to preload your SSH public key.
  user_data = <<EOF
#cloud-config
ssh_authorized_keys:
  - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDboxKOJXEY6xenaUFxvESg3IBXAtjoqPiSq3zgxfovhQLxVlMaHWyS4dk1rDpW83UY6l9yvlYg9OksBDJbCBuGz7qlG7pZxI4YyD2fLiUZlNBYQ1uivcvN23QNcHPiviYRKWsAL5hRJPg2Geyc7BJyg+gXyGh7Juu53xtICiUuqYTPY/k7NtK8MTNa8pMRO5HOFbGb/P9MhsUOK1aCLr47u/iyL10knUlLV/ITHtT9uHM4JF+zNnZCzGvtujRwLziTN8YmlmT4Jui80gPIieerhOKavWRrmYpuy7uPlcnttVOXkKTqEz2MruxY/49h+rcrZZcQDHT/BrbjkJGElaB omps@MacOss-MacBook-Pro.local
EOF

  network_adapter {
    type           = "bridged"
    host_interface = "en0"
  }
}

resource "null_resource" "update_hosts" {
  depends_on = [virtualbox_vm.ubuntu_vm]
  triggers = {
    vm_ip    = virtualbox_vm.ubuntu_vm.network_adapter.0.ipv4_address
    hostname = virtualbox_vm.ubuntu_vm.name
  }

  provisioner "local-exec" {
    command = "grep -q '${self.triggers.hostname}' /etc/hosts || echo '${self.triggers.vm_ip} ${self.triggers.hostname}' | sudo tee -a /etc/hosts"
  }
}
