#### Install kubeadm cluster on mac os sequoia
- Install Vagrant
``` brew install vagrant```

- Donwload and install the latest version of virtualbox from virtualbox.org

- Changes to make in install-kubeadm.sh file.

- At the time of first installtion which is on 26 February 2025 the kubeadm version was 1.32 hence the apt repository url contains the same version. if you are using this repository make sure you select the appropriate version.

- Run
1. ```vagrant up #for starting up the vm's this will start 3 vms```
2. ```vagrant ssh #for sshing in the machine```
3. ```vagrant destroy #for clearing the virtual macihnes```

Enjoii
