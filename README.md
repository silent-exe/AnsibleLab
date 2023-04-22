# Ansible Environment: 

Multi-Machine Vagrant Environments:
This Vagrantfile will create 3 Centos VM's to simulate Ansible control machine and 2 target hosts. 

* Host1 - No GUI
* Host2 - No GUI
* Host3 - No GUI
* Host4 - No GUI
* ansible-host - No GUI, ansible core installed and Ansible-tower


## Requirements:

* Internet connection is a must!
* Make sure the VT support is enabled on your BIOS
* Vagrant - 1.9.x or higher
* Vagrant plugins - vagrant-proxyconf - needed if you are running behind proxy
* Ansible: latest
* Virtualbox: latest


## Other files included:
- ansible.cfg
- inventory
- bootstrap-node.sh
- ansible-install.yaml
- playbook.yaml
- inventory-test.yaml

## Connecting the dots:
Before you run vagrant up, make sure that you updated the Vagrantfile to your desired configuration. Specifically use the box that are available from https://atlas.hashicorp.com/boxes/. The entry on the current vagrant file are Datacom specific boxes and is not available from atlas.

Once you are done: 
- _vagrant up_
  Wait for about 6 minutes to finish the build. Once done. You can try to ssh to your ansible-host vm. You can verify this by using "_vagrant status_"

- _vagrant ssh ansible-host_ 
  once you are login to your ansible-host vm, you can now verify if the other vm are reachable. The command to use is: "_ansible-playbook -i inventory playbook/ping.yml_"

## Ansible Testing

## The Vagrantfile:

```
Vagrant.configure("2") do |config|
# Define VMs with static private IP addresses, vcpu, memory and vagrant-box.
  boxes = [
    {
      :name => "web10.demo.com",
      :box => "generic/centos9s",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.56.200"
    },
    {
      :name => "web20.demo.com",
      :box => "generic/centos9s",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.56.201"
    },
    {
      :name => "db.demo.com",
      :box => "generic/centos9s",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.56.202"
    },
    {
      :name => "lb.demo.com",
      :box => "generic/centos9s",
      :ram => 1024,
      :vcpu => 1,
      :ip => "192.168.56.203"
    },
    {
      :name => "ansible-host",
      :box => "generic/centos9s",
      :ram => 8048,
      :vcpu => 1,
      :ip => "192.168.56.210"
    }
  ]


  # Provision each of the VMs.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
#   Only Enable this if you are connecting to Proxy server
#      config.proxy.http     = "http://x.x.x.x:3128"
#      config.proxy.https    = "http://x.x.x.x:3128"
#      config.proxy.no_proxy = "localhost,127.0.0.1"
      config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
      config.ssh.insert_key = false
      config.vm.box = opts[:box]
      config.vm.hostname = opts[:name]
      config.vm.provider :virtualbox do |v|
        v.memory = opts[:ram]
        v.cpus = opts[:vcpu]
      end

```


