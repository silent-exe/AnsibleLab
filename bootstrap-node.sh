
# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<-EOL
# vagrant environment nodes
192.168.2.200  Web10.demo.com
192.168.2.201  Web20.demo.com
192.168.2.202  db.demo.com
192.168.2.203  lb.demo.com
192.168.2.210  ansible-Tower