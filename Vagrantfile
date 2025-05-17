# -*- mode: ruby -*-
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp-education/ubuntu-24-04"
  config.vm.box_version = "0.1.0"
  # config.vm.cpus = 2
  # config.vm.memory = 2048
  config.vm.disk :disk, primary: true, size: "50GB"
  config.vm.provider "virtualbox" do |vb|
    vb.memory =  "2048"
    vb.cpus = 2
    #vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    #vb.customize ["modifyvm", :id, "--nic1", "hostonly"]
    #vb.customize ["modifyvm", :id, "--hostonlyadapter1", "vboxnet0"]
  end
  config.vm.provision "shell", name: "install-kubeadm", path: "install-kubeadm.sh"
  # config.vm.network "private_network", type: "dhcp", virtualbox__intnet: "vgrantnet-vbox1"
  config.vm.define "k8s-controller" do |k8sc|
    k8sc.vm.hostname = "k8s-controller"
    k8sc.vm.network "private_network", ip: "192.168.33.10", name: "vagrantnet-vbox1"
  end
  config.vm.define "k8s-node1" do |k8sn1|
    k8sn1.vm.hostname = "k8s-node1"
    k8sn1.vm.network "private_network", ip: "192.168.33.20", name: "vagrantnet-vbox1"
  end

#  config.vm.define "k8s-node2" do |k8sn2|
#    k8sn2.vm.hostname = "k8s-node2"
#    k8sn2.vm.network "private_network", ip: "192.168.33.30"
#  end
end
