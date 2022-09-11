#!/bin/sh
echo "Initializing provisioning file for Control Node"
sudo yum -y install epel-release
echo "Installing Ansible"
sudo yum -y install ansible
echo "Ansible Installed"
cat <<EOT >> /etc/hosts
192.168.33.10 control-node
192.168.33.11 app01
192.168.33.12 db01
EOT
