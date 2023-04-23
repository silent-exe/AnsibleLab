
# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<-EOL
# vagrant environment nodes
192.168.56.200  Web10.demo.com
192.168.56.201  Web20.demo.com
192.168.56.202  db.demo.com
192.168.56.203  lb.demo.com
192.168.56.210  ansible-Tower
