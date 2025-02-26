# -*- mode: ruby -*-
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp-education/ubuntu-24-04"
  config.vm.box_version = "0.1.0"
  config.vm.provision "shell", name: "install-kubeadm", path: "install-kubeadm.sh"
  config.vm.define "k8s-controller" do |k8sc|
    k8sc.vm.hostname = "k8s-controller"
    k8sc.vm.network "private_network", ip: "192.168.33.10"
  end
  config.vm.define "k8s-node1" do |k8sn1|
    k8sn1.vm.hostname = "k8s-node1"
    k8sn1.vm.network "private_network", ip: "192.168.33.20"
  end

  config.vm.define "k8s-node2" do |k8sn2|
    k8sn2.vm.hostname = "k8s-node2"
    k8sn2.vm.network "private_network", ip: "192.168.33.20"
  end
end
