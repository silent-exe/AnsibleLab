
# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<-EOL
# vagrant environment nodes
192.168.149.200  Web1.demo.com
192.168.149.201  Web2.demo.com
192.168.149.210  ansible-host
