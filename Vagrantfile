# -*- mode: ruby -*-
# vi: set ft=ruby :

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
#      config.proxy.http     = "http://usernam:password@x.y:80"
#      config.proxy.https    = "http://usernam:password@x.y:80"
#      config.proxy.no_proxy = "localhost,127.0.0.1"
      config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
      config.ssh.insert_key = false
      config.vm.box = opts[:box]
      config.vm.hostname = opts[:name]
      config.vm.provider :virtualbox do |v|
        v.memory = opts[:ram]
        v.cpus = opts[:vcpu]
      end
      config.vm.network :private_network, ip: opts[:ip]
      config.vm.provision :file do |file|
         file.source     = './keys/vagrant'
         file.destination    = '/tmp/vagrant'
        end
      config.vm.provision :file do |file|
        file.source     = './inventory-test.yaml'
        file.destination    = '/home/vagrant/inventory-test.yaml'
       end
      config.vm.provision :shell, path: "bootstrap-node.sh"
      #config.vm.provision :ansible do |ansible|
      #  ansible.verbose = "v"
      #  ansible.playbook = "playbook.yml"
      #end
   end
  end
end
